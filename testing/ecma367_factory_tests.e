note
	description: "[
		Sweep of the whole {ECMA367_PRODUCTIONS} factory.

		The library's headline claim is that every ECMA-367 non-terminal has a
		factory feature that yields a parsed {BNF_PRODUCTION}. This test calls
		all 224 of them. Because the contracts are compiled in, a single
		unparsable right side raises and the test fails - which is how the
		28 productions written with a concrete separator, and Bracket's
		terminal-only right side, were caught.

		Generated once from the factory's feature list; regenerate by hand if
		productions are added.
	]"
	author: "Larry Rix"
	date: "$Date$"
	testing: "covers"

class
	ECMA367_FACTORY_TESTS

inherit
	TEST_SET_BASE

feature -- Tests

	test_every_production_instantiates
			-- Every one of the 224 factory features builds a well-formed production.
		note
			testing: "covers/{ECMA367_PRODUCTIONS}"
		local
			l_factory: ECMA367_PRODUCTIONS
			l_well_formed: INTEGER
		do
			create l_factory

			l_well_formed := l_well_formed + well_formed (l_factory.construct)
			l_well_formed := l_well_formed + well_formed (l_factory.class_name)
			l_well_formed := l_well_formed + well_formed (l_factory.class_declaration)
			l_well_formed := l_well_formed + well_formed (l_factory.notes)
			l_well_formed := l_well_formed + well_formed (l_factory.note_list)
			l_well_formed := l_well_formed + well_formed (l_factory.note_entry)
			l_well_formed := l_well_formed + well_formed (l_factory.note_name)
			l_well_formed := l_well_formed + well_formed (l_factory.note_values)
			l_well_formed := l_well_formed + well_formed (l_factory.note_item)
			l_well_formed := l_well_formed + well_formed (l_factory.class_header)
			l_well_formed := l_well_formed + well_formed (l_factory.header_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.obsolete_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.message)
			l_well_formed := l_well_formed + well_formed (l_factory.features)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_clause)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_declaration_list)
			l_well_formed := l_well_formed + well_formed (l_factory.header_comment)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_declaration)
			l_well_formed := l_well_formed + well_formed (l_factory.declaration_body)
			l_well_formed := l_well_formed + well_formed (l_factory.query_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.type_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_value)
			l_well_formed := l_well_formed + well_formed (l_factory.explicit_value)
			l_well_formed := l_well_formed + well_formed (l_factory.new_feature_list)
			l_well_formed := l_well_formed + well_formed (l_factory.new_feature)
			l_well_formed := l_well_formed + well_formed (l_factory.attribute_or_routine)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_body)
			l_well_formed := l_well_formed + well_formed (l_factory.extended_feature_name)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_name)
			l_well_formed := l_well_formed + well_formed (l_factory.alias_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.alias_name)
			l_well_formed := l_well_formed + well_formed (l_factory.bracket_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.operator_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.unary)
			l_well_formed := l_well_formed + well_formed (l_factory.binary)
			l_well_formed := l_well_formed + well_formed (l_factory.assigner_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.inheritance)
			l_well_formed := l_well_formed + well_formed (l_factory.inherit_clause)
			l_well_formed := l_well_formed + well_formed (l_factory.non_conformance)
			l_well_formed := l_well_formed + well_formed (l_factory.parent_list)
			l_well_formed := l_well_formed + well_formed (l_factory.parent)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_adaptation)
			l_well_formed := l_well_formed + well_formed (l_factory.rename_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.rename_list)
			l_well_formed := l_well_formed + well_formed (l_factory.rename_pair)
			l_well_formed := l_well_formed + well_formed (l_factory.clients)
			l_well_formed := l_well_formed + well_formed (l_factory.class_list)
			l_well_formed := l_well_formed + well_formed (l_factory.new_exports)
			l_well_formed := l_well_formed + well_formed (l_factory.new_export_list)
			l_well_formed := l_well_formed + well_formed (l_factory.new_export_item)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_set)
			l_well_formed := l_well_formed + well_formed (l_factory.feature_list)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_arguments)
			l_well_formed := l_well_formed + well_formed (l_factory.entity_declaration_list)
			l_well_formed := l_well_formed + well_formed (l_factory.entity_declaration_group)
			l_well_formed := l_well_formed + well_formed (l_factory.identifier_list)
			l_well_formed := l_well_formed + well_formed (l_factory.deferred_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.effective_routine)
			l_well_formed := l_well_formed + well_formed (l_factory.internal_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.routine_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.once_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.key_list_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.local_declarations)
			l_well_formed := l_well_formed + well_formed (l_factory.compound)
			l_well_formed := l_well_formed + well_formed (l_factory.instruction_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.precondition)
			l_well_formed := l_well_formed + well_formed (l_factory.postcondition)
			l_well_formed := l_well_formed + well_formed (l_factory.invariant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.assertion)
			l_well_formed := l_well_formed + well_formed (l_factory.assertion_clause)
			l_well_formed := l_well_formed + well_formed (l_factory.unlabeled_assertion_clause)
			l_well_formed := l_well_formed + well_formed (l_factory.tag_mark_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.tag_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.old_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.only_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.check_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.variant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.precursor_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.parent_qualification)
			l_well_formed := l_well_formed + well_formed (l_factory.redefine_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.undefine_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.type_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.class_or_tuple_type)
			l_well_formed := l_well_formed + well_formed (l_factory.class_type)
			l_well_formed := l_well_formed + well_formed (l_factory.attachment_mark)
			l_well_formed := l_well_formed + well_formed (l_factory.anchored)
			l_well_formed := l_well_formed + well_formed (l_factory.anchor)
			l_well_formed := l_well_formed + well_formed (l_factory.actual_generics)
			l_well_formed := l_well_formed + well_formed (l_factory.type_list)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_generics)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_generic_list)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_generic)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_generic_name)
			l_well_formed := l_well_formed + well_formed (l_factory.constraint)
			l_well_formed := l_well_formed + well_formed (l_factory.constraining_types)
			l_well_formed := l_well_formed + well_formed (l_factory.single_constraint)
			l_well_formed := l_well_formed + well_formed (l_factory.renaming)
			l_well_formed := l_well_formed + well_formed (l_factory.multiple_constraint)
			l_well_formed := l_well_formed + well_formed (l_factory.constraint_list)
			l_well_formed := l_well_formed + well_formed (l_factory.constraint_creators)
			l_well_formed := l_well_formed + well_formed (l_factory.tuple_type)
			l_well_formed := l_well_formed + well_formed (l_factory.tuple_parameter_list)
			l_well_formed := l_well_formed + well_formed (l_factory.tuple_parameters)
			l_well_formed := l_well_formed + well_formed (l_factory.manifest_tuple)
			l_well_formed := l_well_formed + well_formed (l_factory.expression_list_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.converters_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.converter_list)
			l_well_formed := l_well_formed + well_formed (l_factory.converter)
			l_well_formed := l_well_formed + well_formed (l_factory.conversion_procedure)
			l_well_formed := l_well_formed + well_formed (l_factory.conversion_query)
			l_well_formed := l_well_formed + well_formed (l_factory.select_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.conditional)
			l_well_formed := l_well_formed + well_formed (l_factory.then_part_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.else_part_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.multi_branch)
			l_well_formed := l_well_formed + well_formed (l_factory.when_part_list_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.when_part_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.choices_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.choice_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.constant_interval_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.type_interval_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.loop_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.initialization_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.exit_condition_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.loop_body_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.debug_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.attribute_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.entity_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.variable_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.variable_attribute)
			l_well_formed := l_well_formed + well_formed (l_factory.local_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.read_only_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.formal_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.constant_attribute_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.creators)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_clause)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_procedure_list)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_procedure)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_instruction)
			l_well_formed := l_well_formed + well_formed (l_factory.explicit_creation_type)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_call)
			l_well_formed := l_well_formed + well_formed (l_factory.explicit_creation_call)
			l_well_formed := l_well_formed + well_formed (l_factory.creation_expression)
			l_well_formed := l_well_formed + well_formed (l_factory.equality_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.comparison_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.assignment_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.assigner_call)
			l_well_formed := l_well_formed + well_formed (l_factory.call_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.object_call)
			l_well_formed := l_well_formed + well_formed (l_factory.unqualified_call)
			l_well_formed := l_well_formed + well_formed (l_factory.target_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.parenthesized_target)
			l_well_formed := l_well_formed + well_formed (l_factory.non_object_call)
			l_well_formed := l_well_formed + well_formed (l_factory.actuals)
			l_well_formed := l_well_formed + well_formed (l_factory.actual_list)
			l_well_formed := l_well_formed + well_formed (l_factory.object_test)
			l_well_formed := l_well_formed + well_formed (l_factory.rescue_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.retry_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.call_agent_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.inline_agent_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.call_agent_body)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_qualified)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_unqualified)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_target)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_actuals)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_actual_list)
			l_well_formed := l_well_formed + well_formed (l_factory.agent_actual)
			l_well_formed := l_well_formed + well_formed (l_factory.placeholder)
			l_well_formed := l_well_formed + well_formed (l_factory.expression)
			l_well_formed := l_well_formed + well_formed (l_factory.basic_expression)
			l_well_formed := l_well_formed + well_formed (l_factory.special_expression)
			l_well_formed := l_well_formed + well_formed (l_factory.parenthesized_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.address_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.once_string)
			l_well_formed := l_well_formed + well_formed (l_factory.boolean_expression_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.operator_expression)
			l_well_formed := l_well_formed + well_formed (l_factory.unary_expression_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.binary_expression_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.bracket_expression)
			l_well_formed := l_well_formed + well_formed (l_factory.bracket_target)
			l_well_formed := l_well_formed + well_formed (l_factory.constant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.constant_attribute_2_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.manifest_constant)
			l_well_formed := l_well_formed + well_formed (l_factory.manifest_type)
			l_well_formed := l_well_formed + well_formed (l_factory.manifest_value)
			l_well_formed := l_well_formed + well_formed (l_factory.sign_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.integer_constant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.character_constant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.boolean_constant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.real_constant_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.manifest_string_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.basic_manifest_string)
			l_well_formed := l_well_formed + well_formed (l_factory.string_content_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.verbatim_string_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.verbatim_string_opener)
			l_well_formed := l_well_formed + well_formed (l_factory.verbatim_string_closer)
			l_well_formed := l_well_formed + well_formed (l_factory.open_bracket_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.close_bracket_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.external_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.external_language)
			l_well_formed := l_well_formed + well_formed (l_factory.unregistered_language)
			l_well_formed := l_well_formed + well_formed (l_factory.external_name)
			l_well_formed := l_well_formed + well_formed (l_factory.registered_language)
			l_well_formed := l_well_formed + well_formed (l_factory.external_signature)
			l_well_formed := l_well_formed + well_formed (l_factory.external_argument_types)
			l_well_formed := l_well_formed + well_formed (l_factory.external_type_list)
			l_well_formed := l_well_formed + well_formed (l_factory.external_type_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.external_file_use)
			l_well_formed := l_well_formed + well_formed (l_factory.external_file_list)
			l_well_formed := l_well_formed + well_formed (l_factory.external_file_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.external_user_file)
			l_well_formed := l_well_formed + well_formed (l_factory.external_system_file)
			l_well_formed := l_well_formed + well_formed (l_factory.c_external_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.dll_external_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.dll_identifier)
			l_well_formed := l_well_formed + well_formed (l_factory.dll_index)
			l_well_formed := l_well_formed + well_formed (l_factory.comment_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.comment_break_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.integer_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.integer_base_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.integer_base_letter_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.digit_sequence_prod)
			l_well_formed := l_well_formed + well_formed (l_factory.digit_prod)

			assert_integers_equal ("declared_count", 224, l_factory.production_count)
			assert_integers_equal ("all_productions_well_formed", 224, l_well_formed)
		end

feature {NONE} -- Implementation

	well_formed (a_production: BNF_PRODUCTION): INTEGER
			-- 1 when `a_production' names a construct, carries a right side and
			-- yielded at least one component; 0 otherwise.
		do
			if not a_production.construct_name.is_empty and then
				not a_production.right_side.is_empty and then
				a_production.components.count >= 1
			then
				Result := 1
			end
		ensure
			zero_or_one: Result = 0 or Result = 1
		end

end
