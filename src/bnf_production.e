note
	description: "[
		A formal description of the structure of all specimens of a non-terminal construct.

		Per ECMA-367 sections 8.2.6-8.2.12, a production formally describes how components
		conforming to a linguistic construct must be structured. Every construct has exactly
		one production rule defining its specimens.

		Form: Construct =Δ right-side

		Three Production Types:
		1. Aggregate (Fixed sequence): C1 C2 [C3] C4 (optional components in brackets)
		2. Choice (Alternatives): C1 | C2 | C3 (exactly one variant selected)
		3. Repetition (Variable count): {C § ...}* or C+ (zero+ or one+ repetitions)

		This class provides validation using simple_regex patterns and component extraction
		from right-side specifications.
	]"
	author: "Larry Rix"
	date: "$Date$"
	revision: "$Revision$"
	standards: "ECMA-367:2026 sections 8.2.6-8.2.12 (Production Rules)"
	see_also: "[
		- BNF_COMPONENT: A concrete piece conforming to this production
		- BNF_CONSTRUCT: The abstract syntactic rule
		- BNF_SPECIMEN: A concrete instance manifesting this production's structure
	]"

class
	BNF_PRODUCTION

create
	make,
	make_aggregate,
	make_choice,
	make_repetition,
	make_from_text

feature {NONE} -- Initialization

	make
			-- Initialize empty production with default names and component list
		do
			is_aggregate := True
			is_choice := False
			is_repetition := False
			create construct_name.make_empty
			create right_side.make_empty
			create components.make (0)
		ensure
			construct_empty: construct_name.is_empty
			right_side_empty: right_side.is_empty
			components_created: components /= Void
		end

	make_aggregate (a_name: READABLE_STRING_GENERAL; a_spec: READABLE_STRING_GENERAL)
			-- Create aggregate production: C1 C2 [C3]
		require
			name_not_empty: a_name /= Void and not a_name.is_empty
			spec_not_empty: a_spec /= Void and not a_spec.is_empty
		do
			create construct_name.make_from_string (a_name.as_string_32)
			create right_side.make_from_string (a_spec.as_string_32)
			create components.make (10)
			is_aggregate := True
			is_choice := False
			is_repetition := False
			parse_components
		ensure
			is_aggregate: is_aggregate
			construct_not_empty: not construct_name.is_empty
			spec_not_empty: not right_side.is_empty
			components_initialized: components /= Void
		end

	make_choice (a_name: READABLE_STRING_GENERAL; a_spec: READABLE_STRING_GENERAL)
			-- Create choice production: C1 | C2 | C3
		require
			name_not_empty: a_name /= Void and not a_name.is_empty
			spec_not_empty: a_spec /= Void and not a_spec.is_empty
		do
			create construct_name.make_from_string (a_name.as_string_32)
			create right_side.make_from_string (a_spec.as_string_32)
			create components.make (10)
			is_aggregate := False
			is_choice := True
			is_repetition := False
			parse_components
		ensure
			is_choice: is_choice
			has_variants: components.count >= 1
			construct_not_empty: not construct_name.is_empty
			spec_not_empty: not right_side.is_empty
		end

	make_repetition (a_name: READABLE_STRING_GENERAL; a_spec: READABLE_STRING_GENERAL)
			-- Create repetition production: {C § ...}* or C+
		require
			name_not_empty: a_name /= Void and not a_name.is_empty
			spec_not_empty: a_spec /= Void and not a_spec.is_empty
		do
			create construct_name.make_from_string (a_name.as_string_32)
			create right_side.make_from_string (a_spec.as_string_32)
			create components.make (10)
			is_aggregate := False
			is_repetition := True
			is_choice := False
			parse_components
		ensure
			is_repetition: is_repetition
			construct_not_empty: not construct_name.is_empty
			spec_not_empty: not right_side.is_empty
			components_initialized: components /= Void
		end

	make_from_text (a_name: READABLE_STRING_GENERAL; a_spec: READABLE_STRING_GENERAL)
			-- Auto-detect production type and parse
		require
			name_not_empty: a_name /= Void and not a_name.is_empty
			spec_not_empty: a_spec /= Void and not a_spec.is_empty
		do
			create construct_name.make_from_string (a_name.as_string_32)
			create right_side.make_from_string (a_spec.as_string_32)
			create components.make (10)
			detect_production_type
			parse_components
		ensure
			type_detected: is_aggregate or is_choice or is_repetition
			construct_not_empty: not construct_name.is_empty
			spec_not_empty: not right_side.is_empty
			components_extracted: components /= Void
		end

feature -- Access

	construct_name: STRING_32
			-- Left-hand side of production (the Construct being defined).
		attribute
			create Result.make_empty
		end

	right_side: STRING_32
			-- Right-hand side specification (the production rule itself).
		attribute
			create Result.make_empty
		end

	components: ARRAYED_LIST [STRING_32]
			-- List of extracted components from right_side.
		attribute
			create Result.make (0)
		end

	pattern_regex: detachable SIMPLE_REGEX
			-- Compiled regex for identifying specimens of this production in code.

feature -- Status: Production Type Classification

	is_aggregate: BOOLEAN
			-- Is this an aggregate (fixed sequence) production?

	is_choice: BOOLEAN
			-- Is this a choice (alternative variants) production?

	is_repetition: BOOLEAN
			-- Is this a repetition (variable count) production?

feature -- Validation

	is_valid: BOOLEAN
			-- Does right_side satisfy all syntax validation rules?
		do
			Result := validate_syntax
		end

	validate_syntax: BOOLEAN
			-- Validate right_side matches one of the three production forms
		local
			l_rx: SIMPLE_REGEX
		do
			if right_side.is_empty then
				Result := False
			else
				create l_rx.make_from_pattern ("\|")
				if l_rx.match (right_side.to_string_32).is_matched then
					Result := validate_choice_syntax
				else
					create l_rx.make_from_pattern ("\{.+§.+\}[\*\+]|.+[\*\+]\s*$")
					if l_rx.match (right_side.to_string_32).is_matched then
						Result := validate_repetition_syntax
					else
						Result := validate_aggregate_syntax
					end
				end
			end
		ensure
			consistent_with_type: Result implies (is_aggregate or is_choice or is_repetition)
		end

feature -- Validation Implementation

	validate_aggregate_syntax: BOOLEAN
			-- Validate aggregate pattern: "C1 C2 [C3] C4"
		local
			l_rx: SIMPLE_REGEX
		do
			create l_rx.make_from_pattern ("^(\w+|\[\w+\])(\s+(\w+|\[\w+\]))*$")
			Result := l_rx.match (right_side.to_string_32).is_matched
		end

	validate_choice_syntax: BOOLEAN
			-- Validate choice pattern: "C1 | C2 | C3"
		local
			l_rx: SIMPLE_REGEX
		do
			create l_rx.make_from_pattern ("^\w+(\s*\|\s*\w+)+$")
			Result := l_rx.match (right_side.to_string_32).is_matched
		end

	validate_repetition_syntax: BOOLEAN
			-- Validate repetition pattern: "{C § ...}*" or "C+"
		local
			l_rx: SIMPLE_REGEX
		do
			create l_rx.make_from_pattern ("^(\{.+§.+\}[\*\+]|\w+[\*\+])$")
			Result := l_rx.match (right_side.to_string_32).is_matched
		end

feature -- Parsing

	parse_components
			-- Extract components from right_side based on production type
		do
			components.wipe_out
			if is_choice then
				parse_choice_components
			elseif is_repetition then
				parse_repetition_components
			else
				parse_aggregate_components
			end
		ensure
			components_exist: components /= Void
		end

	parse_aggregate_components
			-- Extract "C1 C2 [C3]" into ["C1", "C2", "[C3]"]
			--
			-- Quoted terminals count as components: an ECMA-367 Aggregate is a
			-- sequence of constructs AND terminals, and a right side made only
			-- of terminals - Bracket is exactly `"[]"' - extracted nothing at
			-- all, failing `all_components_extracted'.
		local
			l_rx: SIMPLE_REGEX
			l_matches: SIMPLE_REGEX_MATCH_LIST
		do
			create l_rx.make_from_pattern ("\w+|\[\w+\]|%"[^%"]*%"")
			l_matches := l_rx.match_all (right_side.to_string_32)
			across l_matches as ic_item loop
				components.extend (create {STRING_32}.make_from_string (ic_item.value))
			end
		ensure
			all_components_extracted: components.count > 0
		end

	parse_choice_components
			-- Extract "C1 | C2 | C3" into ["C1", "C2", "C3"]
			--
			-- Scans for the alternatives rather than splitting on the bar.
			-- {SIMPLE_REGEX}.split accepts a READABLE_STRING_GENERAL but its
			-- gobo backend requires an 8-bit subject, so splitting a STRING_32
			-- right side violated `subject_is_string' and EVERY choice
			-- production raised instead of parsing.
		local
			l_rx: SIMPLE_REGEX
			l_matches: SIMPLE_REGEX_MATCH_LIST
			l_variant: STRING_32
		do
			create l_rx.make_from_pattern ("[^|]+")
			l_matches := l_rx.match_all (right_side.to_string_32)
			across l_matches as ic_item loop
				l_variant := ic_item.value.twin
				l_variant.left_adjust
				l_variant.right_adjust
				if not l_variant.is_empty then
					components.extend (l_variant)
				end
			end
		ensure
			multiple_variants: components.count >= 1
		end

	parse_repetition_components
			-- Extract component from "{C § ...}*" or "C+"
		local
			l_rx: SIMPLE_REGEX
			l_match: SIMPLE_REGEX_MATCH
			l_matches: SIMPLE_REGEX_MATCH_LIST
		do
			create l_rx.make_from_pattern ("\{(\w+)\s*§\s*\.\.\.\}[\*\+]")
			l_match := l_rx.match (right_side.to_string_32)
			if l_match.is_matched and then attached l_match.group (1) as al_comp then
				components.extend (create {STRING_32}.make_from_string (al_comp))
			else
				create l_rx.make_from_pattern ("^(\w+)[\*\+]$")
				l_match := l_rx.match (right_side.to_string_32)
				if l_match.is_matched and then attached l_match.group (1) as al_comp then
					components.extend (create {STRING_32}.make_from_string (al_comp))
				else
						-- ECMA-367 writes the separator as a concrete terminal
						-- rather than the schematic section sign, and a group may
						-- repeat more than one construct:
						--     {Note_entry ";" ...}*
						--     {Simple_string Line_wrapping_part ...}+
						-- Take the construct names and leave the separator, which
						-- is punctuation between specimens, not a component.
					create l_rx.make_from_pattern ("\w+")
					l_matches := l_rx.match_all (right_side.to_string_32)
					across l_matches as ic_item loop
						components.extend (create {STRING_32}.make_from_string (ic_item.value))
					end
				end
			end
		ensure
			at_least_one_component: components.count >= 1
		end

feature -- Type Detection

	detect_production_type
			-- Auto-detect production type from right_side syntax
		local
			l_rx: SIMPLE_REGEX
		do
			create l_rx.make_from_pattern ("\|")
			if l_rx.match (right_side.to_string_32).is_matched then
				is_choice := True
				is_aggregate := False
				is_repetition := False
			else
				create l_rx.make_from_pattern ("\{.+§.+\}[\*\+]|.+[\*\+]\s*$")
				if l_rx.match (right_side.to_string_32).is_matched then
					is_repetition := True
					is_aggregate := False
					is_choice := False
				else
					is_aggregate := True
					is_choice := False
					is_repetition := False
				end
			end
		ensure
			one_type_set: (is_aggregate and not is_choice and not is_repetition) or
						  (is_choice and not is_aggregate and not is_repetition) or
						  (is_repetition and not is_aggregate and not is_choice)
		end

	make_with_pattern (a_name: READABLE_STRING_GENERAL; a_spec: READABLE_STRING_GENERAL; a_pattern: READABLE_STRING_GENERAL)
			-- Create production with compiled regex pattern for identification
		require
			name_not_empty: a_name /= Void and not a_name.is_empty
			spec_not_empty: a_spec /= Void and not a_spec.is_empty
			pattern_not_empty: a_pattern /= Void and not a_pattern.is_empty
		do
			create construct_name.make_from_string (a_name.as_string_32)
			create right_side.make_from_string (a_spec.as_string_32)
			create pattern_regex.make_from_pattern (a_pattern.to_string_32)
			create components.make (10)
			detect_production_type
			parse_components
		ensure
			type_detected: is_aggregate or is_choice or is_repetition
			pattern_compiled: pattern_regex /= Void
			components_extracted: components /= Void
		end

invariant
	components_exists: components /= Void
	exactly_one_type: (is_aggregate and not is_choice and not is_repetition) or
					  (is_choice and not is_aggregate and not is_repetition) or
					  (is_repetition and not is_aggregate and not is_choice)

end
