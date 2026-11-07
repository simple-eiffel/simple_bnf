note
	description: "[
		Test set for simple_bnf.

		Two groups:

		1. The curated regexes of {BNF_CONSTANTS} are run against real Eiffel
		   source and a local fixture, because a regex constant that does not
		   match the construct it names is worthless.

		2. The BNF-E object model - {BNF_SPECIMEN}, {BNF_COMPONENT},
		   {BNF_PRODUCTION}, the {ECMA367_PRODUCTIONS} factory and the
		   {ECMA367_PRODUCTION_PATTERNS} registry - is exercised on exactly the
		   calls the README shows, so no published example is unverified.

		Every test file this suite reads lives inside the library (`src/' and
		`testing/test_data/'); nothing outside the repository is touched. The
		two source-reading tests are relative to the current directory, so run
		the executable from the library root.

		Contracts ARE tests brought into the classes: each call below also
		executes the preconditions, postconditions and invariants involved.
	]"
	author: "Larry Rix"
	date: "$Date$"
	revision: "$Revision$"
	testing: "covers"

class
	LIB_TESTS

inherit
	TEST_SET_BASE

feature -- Tests: curated regexes

	test_class_definition_rx
			-- Test of {BNF_CONSTANTS}.Class_definition_rx
		note
			testing: "covers/{BNF_CONSTANTS}.Class_definition_rx"
		local
			l_content: STRING_32
			l_matches: ARRAYED_LIST [STRING_32]
		do
			l_content := library_file ("src/bnf_constants.e")
			l_matches := regex.all_matches_for (const.Class_definition_rx, l_content)

			assert_integers_equal ("has_match", 1, l_matches.count)
			assert_strings_equal_diff ("diff_1", "%N%Nclass%N%TBNF_CONSTANTS", l_matches [1])
		end

	test_feature_definition_rx
			-- Test of {BNF_CONSTANTS}.Feature_definition_rx
		note
			testing: "covers/{BNF_CONSTANTS}.Feature_definition_rx"
		local
			l_content: STRING_32
			l_matches: ARRAYED_LIST [STRING_32]
			l_matches_tuple: like regex.all_matches_with_details
		do
			l_content := library_file ("src/bnf_constants.e")
			l_matches := regex.all_matches_for (const.Feature_definition_rx, l_content)

			assert_integers_equal ("feature_blocks_found", 9, l_matches.count)
			assert_strings_equal_diff ("first_feature_is_access", "feature -- Access", l_matches [1])
			assert_strings_equal_diff ("last_feature_is_implementation", "feature {NONE} -- Implementation", l_matches [9])

			l_matches_tuple := regex.all_matches_with_details (const.Feature_definition_rx, l_content)
			assert_integers_equal ("matches_9", 9, l_matches_tuple.count)
			assert_strings_equal_diff ("feature_access", "feature -- Access", l_matches_tuple [1].value)
		end

	test_manifest_string_rx
			-- Test of {BNF_CONSTANTS}.Manifest_string_rx
			-- Matches double-quoted string literals in a local fixture.
		note
			testing: "covers/{BNF_CONSTANTS}.Manifest_string_rx"
		local
			l_content: STRING_32
			l_matches: ARRAYED_LIST [TUPLE [value: STRING_32; start_position: INTEGER;
				end_position: INTEGER; length: INTEGER;
				text_before: STRING_32; text_after: STRING_32]]
		do
			l_content := library_file ("testing/test_data/manifest_string_sample.txt")
			l_matches := regex.all_matches_with_details (const.Manifest_string_rx, l_content)

			assert_integers_equal ("string_literals_in_fixture", 8, l_matches.count)
				-- Position data agrees with a plain scan for the first quote,
				-- whatever the line endings on disk.
			assert_integers_equal ("first_match_start", l_content.index_of ({CHARACTER_32} '%"', 1), l_matches [1].start_position)
			assert_integers_equal ("first_match_length", 32, l_matches [1].length)
			assert_strings_equal_diff ("first_match_value", "%"fixture_for_manifest_string_rx%"", l_matches [1].value)
			assert_strings_equal_diff ("empty_literal_matched", "%"%"", l_matches [5].value)
			assert_strings_equal_diff ("last_match_value", "%"right%"", l_matches [8].value)
		end

feature -- Tests: BNF-E object model

	test_specimen_carries_construct_and_text
			-- {BNF_SPECIMEN} records which construct a piece of text is a specimen of.
		note
			testing: "covers/{BNF_SPECIMEN}.make_with_text"
		local
			l_bare, l_specimen: BNF_SPECIMEN
		do
			create l_bare.make ("Identifier")
			assert_strings_equal_diff ("bare_construct", "Identifier", l_bare.construct_name)
			assert_true ("bare_has_no_source", not l_bare.has_source)

			create l_specimen.make_with_text ("Class_name", "BNF_PRODUCTION")
			assert_strings_equal_diff ("construct", "Class_name", l_specimen.construct_name)
			assert_strings_equal_diff ("source", "BNF_PRODUCTION", l_specimen.source_text)
			assert_true ("has_source", l_specimen.has_source)
		end

	test_component_named_and_terminal
			-- {BNF_COMPONENT} distinguishes terminals from non-terminals.
		note
			testing: "covers/{BNF_COMPONENT}.make_named"
			testing: "covers/{BNF_COMPONENT}.make_terminal"
		local
			l_nonterminal, l_terminal: BNF_COMPONENT
		do
			create l_nonterminal.make_named ({STRING_32} "Class_declaration")
			assert_strings_equal_diff ("nonterminal_name", "Class_declaration", l_nonterminal.name)
			assert_true ("nonterminal_is_not_terminal", not l_nonterminal.is_terminal)
			assert_integers_equal ("no_specimens_yet", 0, l_nonterminal.specimen.node_count)

			create l_terminal.make_terminal ({STRING_32} "class")
			assert_strings_equal_diff ("terminal_name", "class", l_terminal.name)
			assert_true ("terminal_is_terminal", l_terminal.is_terminal)
		end

	test_component_argumentless_make_is_a_known_defect
			-- PINNED DEFECT. {BNF_COMPONENT}.make ensures `name.is_empty' while the
			-- class invariant demands `not name.is_empty', so `create c.make' can
			-- never succeed with assertions on. `make_from_construct' is unusable
			-- for the same reason: {BNF_CONSTRUCT} exposes no way to give a
			-- construct a name. This test passes only while the defect stands; the
			-- day it is repaired the test fails and says so.
		note
			testing: "covers/{BNF_COMPONENT}.make"
		local
			l_violated, l_created: BOOLEAN
			l_component: BNF_COMPONENT
		do
			if not l_violated then
				create l_component.make
				l_created := True
			end
			assert_true ("argumentless_make_must_still_violate_the_class_invariant", not l_created)
		rescue
			if not l_violated then
				l_violated := True
				retry
			end
		end

	test_production_aggregate
			-- An aggregate production is a fixed sequence, optional parts in brackets.
		note
			testing: "covers/{BNF_PRODUCTION}.make_from_text"
		local
			l_production: BNF_PRODUCTION
		do
			create l_production.make_from_text ("Class_declaration", "Notes Class_header Formal_generics")

			assert_true ("is_aggregate", l_production.is_aggregate)
			assert_true ("not_choice", not l_production.is_choice)
			assert_true ("not_repetition", not l_production.is_repetition)
			assert_strings_equal_diff ("construct_name", "Class_declaration", l_production.construct_name)
			assert_integers_equal ("three_components", 3, l_production.components.count)
			assert_strings_equal_diff ("first_component", "Notes", l_production.components [1])
			assert_true ("is_valid", l_production.is_valid)
		end

	test_production_aggregate_keeps_optional_brackets
			-- Optional components keep their brackets, so a caller can tell them apart.
		note
			testing: "covers/{BNF_PRODUCTION}.parse_aggregate_components"
		local
			l_production: BNF_PRODUCTION
		do
			create l_production.make_from_text ("Class_declaration", "Notes Class_header [Formal_generics]")

			assert_true ("is_aggregate", l_production.is_aggregate)
			assert_integers_equal ("three_components", 3, l_production.components.count)
			assert_strings_equal_diff ("optional_component", "[Formal_generics]", l_production.components [3])
		end

	test_production_choice
			-- A choice production offers alternatives; exactly one is selected.
		note
			testing: "covers/{BNF_PRODUCTION}.make_from_text"
		local
			l_production: BNF_PRODUCTION
		do
			create l_production.make_from_text ("Feature_body", "Deferred | Effective_routine | Attribute")

			assert_true ("is_choice", l_production.is_choice)
			assert_true ("not_aggregate", not l_production.is_aggregate)
			assert_integers_equal ("three_variants", 3, l_production.components.count)
			assert_strings_equal_diff ("first_variant", "Deferred", l_production.components [1])
			assert_strings_equal_diff ("last_variant", "Attribute", l_production.components [3])
			assert_true ("is_valid", l_production.is_valid)
		end

	test_production_repetition
			-- A repetition production names the repeated construct.
		note
			testing: "covers/{BNF_PRODUCTION}.make_from_text"
		local
			l_production: BNF_PRODUCTION
		do
			create l_production.make_from_text ("Digit_sequence", "Digit+")

			assert_true ("is_repetition", l_production.is_repetition)
			assert_true ("not_choice", not l_production.is_choice)
			assert_integers_equal ("one_repeated_component", 1, l_production.components.count)
			assert_strings_equal_diff ("repeated_component", "Digit", l_production.components [1])
			assert_true ("is_valid", l_production.is_valid)
		end

	test_production_explicit_constructors_agree_with_detection
			-- The explicit creation procedures classify the same way auto-detection does.
		note
			testing: "covers/{BNF_PRODUCTION}.make_choice"
			testing: "covers/{BNF_PRODUCTION}.make_aggregate"
		local
			l_choice, l_aggregate: BNF_PRODUCTION
		do
			create l_choice.make_choice ("Feature_body", "Deferred | Attribute")
			assert_true ("declared_choice", l_choice.is_choice)
			assert_integers_equal ("two_variants", 2, l_choice.components.count)

			create l_aggregate.make_aggregate ("Notes", "note Note_list")
			assert_true ("declared_aggregate", l_aggregate.is_aggregate)
			assert_integers_equal ("two_components", 2, l_aggregate.components.count)
		end

feature -- Tests: the ECMA-367 catalog

	test_production_names_are_the_full_set
			-- {ECMA367_PRODUCTION_NAMES} carries the whole non-terminal vocabulary.
		note
			testing: "covers/{ECMA367_PRODUCTION_NAMES}.all_production_names"
		local
			l_names: ECMA367_PRODUCTION_NAMES
		do
			create l_names
			assert_integers_equal ("declared_count", 223, l_names.Production_count)
			assert_integers_equal ("actual_count", 223, l_names.all_production_names.count)
			assert_strings_equal_diff ("first_name", "actual_generics", l_names.all_production_names [1])
		end

	test_productions_factory_builds_named_productions
			-- {ECMA367_PRODUCTIONS} is a factory: one feature per non-terminal.
		note
			testing: "covers/{ECMA367_PRODUCTIONS}.class_name"
			testing: "covers/{ECMA367_PRODUCTIONS}.notes"
		local
			l_factory: ECMA367_PRODUCTIONS
			l_production: BNF_PRODUCTION
		do
			create l_factory
			assert_integers_equal ("production_count", 224, l_factory.production_count)

			l_production := l_factory.class_name
			assert_strings_equal_diff ("class_name_construct", "Class_name", l_production.construct_name)
			assert_strings_equal_diff ("class_name_right_side", "Identifier", l_production.right_side)
			assert_true ("class_name_is_aggregate", l_production.is_aggregate)

			l_production := l_factory.notes
			assert_strings_equal_diff ("notes_construct", "Notes", l_production.construct_name)
			assert_integers_equal ("notes_components", 2, l_production.components.count)
		end

	test_pattern_registry_lookup
			-- {ECMA367_PRODUCTION_PATTERNS} maps a production name to a regex, or Void.
		note
			testing: "covers/{ECMA367_PRODUCTION_PATTERNS}.get_pattern"
		local
			l_registry: ECMA367_PRODUCTION_PATTERNS
		do
			create l_registry
			assert_true ("class_name_has_a_pattern", attached l_registry.get_pattern ("class_name"))
			if attached l_registry.get_pattern ("CLASS_NAME") as al_pattern then
				assert_strings_equal_diff ("class_name_pattern", "([A-Z][A-Z0-9_]*)", al_pattern)
			else
				assert_true ("class_name_pattern_attached", False)
			end
			assert_true ("unknown_production_has_none", l_registry.get_pattern ("no_such_production") = Void)
		end

	test_registry_patterns_match_real_eiffel_source
			-- A registered pattern actually finds specimens in real Eiffel text.
		note
			testing: "covers/{ECMA367_PRODUCTION_PATTERNS}.get_pattern"
		local
			l_registry: ECMA367_PRODUCTION_PATTERNS
			l_matches: ARRAYED_LIST [STRING_32]
		do
			create l_registry
			if attached l_registry.get_pattern ("class_name") as al_pattern then
				l_matches := regex.all_matches_for (al_pattern, "class BNF_SPECIMEN")
				assert_integers_equal ("one_class_name", 1, l_matches.count)
				assert_strings_equal_diff ("the_class_name", "BNF_SPECIMEN", l_matches [1])
			else
				assert_true ("class_name_pattern_attached", False)
			end
		end

	test_curated_patterns_are_valid_regexes
			-- Every hand-curated pattern in {ECMA367_PATTERNS} compiles.
		note
			testing: "covers/{ECMA367_PATTERNS}"
		local
			l_patterns: ECMA367_PATTERNS
		do
			create l_patterns
			assert_true ("class_name", regex.is_valid_pattern (l_patterns.class_name_pattern))
			assert_true ("type_mark", regex.is_valid_pattern (l_patterns.type_mark_pattern))
			assert_true ("manifest_string", regex.is_valid_pattern (l_patterns.manifest_string_pattern))
			assert_true ("manifest_real", regex.is_valid_pattern (l_patterns.manifest_real_pattern))
			assert_true ("comment", regex.is_valid_pattern (l_patterns.comment_pattern))
			assert_true ("identifier", regex.is_valid_pattern (l_patterns.identifier_pattern))
		end

feature {NONE} -- Implementation

	const: BNF_CONSTANTS
			-- The curated regex constants under test.
		once
			create Result
		end

	regex: SIMPLE_REGEX
			-- A fresh matcher.
		do
			create Result
		end

	library_file (a_relative: READABLE_STRING_GENERAL): STRING_32
			-- Whole text of the library file at `a_relative' (a "/"-separated path,
			-- relative to the current directory). All test data lives inside this
			-- repository, so the suite runs on any machine that can build it.
		require
			relative_not_empty: not a_relative.is_empty
		local
			l_path: PATH
			l_file: SIMPLE_FILE
		do
			create l_path.make_current
			across a_relative.to_string_32.split ({CHARACTER_32} '/') as ic_step loop
				if not ic_step.is_empty then
					l_path := l_path.extended (ic_step)
				end
			end
			create l_file.make_with_path (l_path)
			Result := l_file.read_all
				-- A checkout can carry either line ending, and only Windows
				-- text reads hide the difference.
			Result.prune_all ({CHARACTER_32} '%R')
		ensure
			result_attached: Result /= Void
			no_carriage_returns: not Result.has ({CHARACTER_32} '%R')
		end

end
