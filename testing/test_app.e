note
	description: "[
		Test runner application for the simple_bnf library.

		The fleet pattern: one `run_test' helper that calls a test agent inside a
		rescue clause, so a contract violation or exception is a reported FAIL
		rather than a dead process, and one line per test method.

		Run from the library root - two tests read files under `src/' and
		`testing/test_data/' by a path relative to the current directory.
	]"
	author: "Larry Rix"
	date: "$Date$"

class
	TEST_APP

create
	make

feature {NONE} -- Initialization

	make
			-- Run the tests.
		do
			print ("Running simple_bnf tests...%N%N")
			passed := 0
			failed := 0

			run_lib_tests
			run_ecma367_factory_tests

			print ("%N========================%N")
			print ("Results: " + passed.out + " passed, " + failed.out + " failed%N")

			if failed > 0 then
				print ("TESTS FAILED%N")
			else
				print ("ALL TESTS PASSED%N")
			end
		end

feature {NONE} -- Test Runners

	run_lib_tests
			-- Run all of LIB_TESTS.
		do
			create lib_tests

				-- Curated regexes
			run_test (agent lib_tests.test_class_definition_rx, "test_class_definition_rx")
			run_test (agent lib_tests.test_feature_definition_rx, "test_feature_definition_rx")
			run_test (agent lib_tests.test_manifest_string_rx, "test_manifest_string_rx")

				-- BNF-E object model
			run_test (agent lib_tests.test_specimen_carries_construct_and_text, "test_specimen_carries_construct_and_text")
			run_test (agent lib_tests.test_component_named_and_terminal, "test_component_named_and_terminal")
			run_test (agent lib_tests.test_component_argumentless_make_is_a_known_defect, "test_component_argumentless_make_is_a_known_defect")
			run_test (agent lib_tests.test_production_aggregate, "test_production_aggregate")
			run_test (agent lib_tests.test_production_aggregate_keeps_optional_brackets, "test_production_aggregate_keeps_optional_brackets")
			run_test (agent lib_tests.test_production_choice, "test_production_choice")
			run_test (agent lib_tests.test_production_repetition, "test_production_repetition")
			run_test (agent lib_tests.test_production_explicit_constructors_agree_with_detection, "test_production_explicit_constructors_agree_with_detection")

				-- The ECMA-367 catalog
			run_test (agent lib_tests.test_production_names_are_the_full_set, "test_production_names_are_the_full_set")
			run_test (agent lib_tests.test_productions_factory_builds_named_productions, "test_productions_factory_builds_named_productions")
			run_test (agent lib_tests.test_pattern_registry_lookup, "test_pattern_registry_lookup")
			run_test (agent lib_tests.test_registry_patterns_match_real_eiffel_source, "test_registry_patterns_match_real_eiffel_source")
			run_test (agent lib_tests.test_curated_patterns_are_valid_regexes, "test_curated_patterns_are_valid_regexes")
		end

	run_ecma367_factory_tests
			-- Sweep every feature of the ECMA-367 production factory.
		do
			create factory_tests
			run_test (agent factory_tests.test_every_production_instantiates, "test_every_production_instantiates")
		end

feature {NONE} -- Implementation

	lib_tests: LIB_TESTS
			-- The curated test set.

	factory_tests: ECMA367_FACTORY_TESTS
			-- The whole-factory sweep.

	passed, failed: INTEGER
			-- Running tallies.

	run_test (a_test: PROCEDURE; a_name: STRING)
			-- Call `a_test', reporting PASS or FAIL under the name `a_name'.
		require
			name_not_empty: not a_name.is_empty
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
				a_test.call (Void)
				print ("  PASS: " + a_name + "%N")
				passed := passed + 1
			end
		rescue
			print ("  FAIL: " + a_name + "%N")
			failed := failed + 1
			l_retried := True
			retry
		end

end
