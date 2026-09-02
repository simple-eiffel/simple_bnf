note
	description: "[
		All 223 ECMA-367 production names as constants.
		Used by PRODUCTION_COLLECTOR to iterate through all productions
		when extracting specimens from Eiffel classes.
	]"
	author: "Production Collector"
	date: "$Date$"

class
	ECMA367_PRODUCTION_NAMES

feature -- Production Names (223 total)

	all_production_names: ARRAY [STRING]
			-- All 223 ECMA-367 production names
		once
			Result := <<

			"actual_generics", "actual_list", "actuals", "address_prod", "agent_actual", 
			"agent_actual_list", "agent_actuals", "agent_prod", "agent_qualified", "agent_target", 
			"agent_unqualified", "alias_name", "alias_prod", "anchor", "anchored", 
			"assertion", "assertion_clause", "assigner_call", "assigner_mark", "assignment_prod", 
			"attachment_mark", "attribute_or_routine", "attribute_prod", "basic_expression", "basic_manifest_string", 
			"binary", "binary_expression_prod", "boolean_constant_prod", "boolean_expression_prod", "bracket_expression", 
			"bracket_prod", "bracket_target", "c_external_prod", "call_agent_body", "call_agent_prod", 
			"call_prod", "character_constant_prod", "check_prod", "choice_prod", "choices_prod", 
			"class_declaration", "class_header", "class_list", "class_name", "class_or_tuple_type", 
			"class_type", "clients", "close_bracket_prod", "comment_break_prod", "comment_prod", 
			"comparison_prod", "compound", "conditional", "constant_attribute_prod", "constant_interval_prod", 
			"constant_prod", "constraining_types", "constraint", "constraint_creators", "constraint_list", 
			"construct", "conversion_procedure", "conversion_query", "converter", "converter_list", 
			"converters_prod", "creation_call", "creation_clause", "creation_expression", "creation_instruction", 
			"creation_procedure", "creation_procedure_list", "creators", "debug_prod", "declaration_body", 
			"deferred_prod", "digit_prod", "digit_sequence_prod", "dll_external_prod", "dll_identifier", 
			"dll_index", "effective_routine", "else_part_prod", "entity_declaration_group", "entity_declaration_list", 
			"entity_prod", "equality_prod", "exit_condition_prod", "explicit_creation_call", "explicit_creation_type", 
			"explicit_value", "expression", "expression_list_prod", "extended_feature_name", "external_argument_types", 
			"external_file_list", "external_file_prod", "external_file_use", "external_language", "external_name", 
			"external_prod", "external_signature", "external_system_file", "external_type_list", "external_type_prod", 
			"external_user_file", "feature_adaptation", "feature_body", "feature_clause", "feature_declaration", 
			"feature_declaration_list", "feature_list", "feature_name", "feature_set", "feature_value", 
			"features", "formal_arguments", "formal_generic", "formal_generic_list", "formal_generic_name", 
			"formal_generics", "formal_prod", "header_comment", "header_mark", "identifier_list", 
			"inherit_clause", "inheritance", "initialization_prod", "inline_agent_prod", "instruction_prod", 
			"integer_base_letter_prod", "integer_base_prod", "integer_constant_prod", "integer_prod", "internal_prod", 
			"invariant_prod", "key_list_prod", "local_declarations", "local_prod", "loop_body_prod", 
			"loop_prod", "manifest_constant", "manifest_string_prod", "manifest_tuple", "manifest_type", 
			"manifest_value", "message", "multi_branch", "multiple_constraint", "new_export_item", 
			"new_export_list", "new_exports", "new_feature", "new_feature_list", "non_conformance", 
			"non_object_call", "note_entry", "note_item", "note_list", "note_name", 
			"note_values", "notes", "object_call", "object_test", "obsolete_prod", 
			"old_prod", "once_prod", "once_string", "only_prod", "open_bracket_prod", 
			"operator_expression", "operator_prod", "parent", "parent_list", "parent_qualification", 
			"parenthesized_prod", "parenthesized_target", "placeholder", "postcondition", "precondition", 
			"precursor_prod", "query_mark", "read_only_prod", "real_constant_prod", "redefine_prod", 
			"registered_language", "rename_list", "rename_pair", "rename_prod", "renaming", 
			"rescue_prod", "retry_prod", "routine_mark", "select_prod", "sign_prod", 
			"single_constraint", "special_expression", "string_content_prod", "tag_mark_prod", "tag_prod", 
			"target_prod", "then_part_prod", "tuple_parameter_list", "tuple_parameters", "tuple_type", 
			"type_interval_prod", "type_list", "type_mark", "type_prod", "unary", 
			"unary_expression_prod", "undefine_prod", "unlabeled_assertion_clause", "unqualified_call", "unregistered_language", 
			"variable_attribute", "variable_prod", "variant_prod", "verbatim_string_closer", "verbatim_string_opener", 
			"verbatim_string_prod", "when_part_list_prod", "when_part_prod"
			>>
		ensure
			correct_count: Result.count = 223
		end

feature -- Statistics

	Production_count: INTEGER = 223
			-- Total number of ECMA-367 productions

end
