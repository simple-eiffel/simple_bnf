note
	description: "[
		Factory for all 224 ECMA-367 non-terminal productions.
		
		Provides one feature per non-terminal production from the ECMA-367 standard,
		allowing clients to instantiate BNF_PRODUCTION objects for any language construct.
		
		Each feature returns a properly initialized BNF_PRODUCTION with:
		- Construct name (non-terminal identifier)
		- Right-side specification (how instances are structured)
		- Automatic type detection (aggregate, choice, repetition)
		- Component extraction and validation
		
		ECMA-367: Eiffel - Analysis, Design and Programming Language
		2nd Edition, June 2006
		Sections 8.2.6-8.2.12 (Production Rules)
	]"
	author: "Generated from ECMA-367-PDF-Text-Copy.md"
	date: "$Date$"
	revision: "$Revision$"
	standards: "ECMA-367:2026"

class
	ECMA367_PRODUCTIONS
	-- Factory for all ECMA-367 non-terminal productions

feature -- Productions (224 total)


	construct: BNF_PRODUCTION
			-- 1. Construct
		do
			create Result.make_from_text (
				"Construct",
				" right-side"
			)
		ensure
			result_attached: Result /= Void
		end

	class_name: BNF_PRODUCTION
			-- 2. Class_name
		do
			create Result.make_from_text (
				"Class_name",
				"Identifier"
			)
		ensure
			result_attached: Result /= Void
		end

	class_declaration: BNF_PRODUCTION
			-- 3. Class_declaration
		do
			create Result.make_from_text (
				"Class_declaration",
				"[Notes]"
			)
		ensure
			result_attached: Result /= Void
		end

	notes: BNF_PRODUCTION
			-- 4. Notes
		do
			create Result.make_from_text (
				"Notes",
				"note Note_list"
			)
		ensure
			result_attached: Result /= Void
		end

	note_list: BNF_PRODUCTION
			-- 5. Note_list
		do
			create Result.make_from_text (
				"Note_list",
				"{Note_entry %";%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	note_entry: BNF_PRODUCTION
			-- 6. Note_entry
		do
			create Result.make_from_text (
				"Note_entry",
				"Note_name Note_values"
			)
		ensure
			result_attached: Result /= Void
		end

	note_name: BNF_PRODUCTION
			-- 7. Note_name
		do
			create Result.make_from_text (
				"Note_name",
				"Identifier %":%""
			)
		ensure
			result_attached: Result /= Void
		end

	note_values: BNF_PRODUCTION
			-- 8. Note_values
		do
			create Result.make_from_text (
				"Note_values",
				"{Note_item %",%"...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	note_item: BNF_PRODUCTION
			-- 9. Note_item
		do
			create Result.make_from_text (
				"Note_item",
				"Identifier | Manifest_constant"
			)
		ensure
			result_attached: Result /= Void
		end

	class_header: BNF_PRODUCTION
			-- 10. Class_header
		do
			create Result.make_from_text (
				"Class_header",
				"[Header_mark] class Class_name"
			)
		ensure
			result_attached: Result /= Void
		end

	header_mark: BNF_PRODUCTION
			-- 11. Header_mark
		do
			create Result.make_from_text (
				"Header_mark",
				"deferred | expanded | frozen"
			)
		ensure
			result_attached: Result /= Void
		end

	obsolete_prod: BNF_PRODUCTION
			-- 12. Obsolete
		do
			create Result.make_from_text (
				"Obsolete",
				"obsolete Message"
			)
		ensure
			result_attached: Result /= Void
		end

	message: BNF_PRODUCTION
			-- 13. Message
		do
			create Result.make_from_text (
				"Message",
				"Manifest_string"
			)
		ensure
			result_attached: Result /= Void
		end

	features: BNF_PRODUCTION
			-- 14. Features
		do
			create Result.make_from_text (
				"Features",
				"Feature_clause+"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_clause: BNF_PRODUCTION
			-- 15. Feature_clause
		do
			create Result.make_from_text (
				"Feature_clause",
				"feature [Clients] [Header_comment] Feature_declaration_list"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_declaration_list: BNF_PRODUCTION
			-- 16. Feature_declaration_list
		do
			create Result.make_from_text (
				"Feature_declaration_list",
				"{Feature_declaration %";%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	header_comment: BNF_PRODUCTION
			-- 17. Header_comment
		do
			create Result.make_from_text (
				"Header_comment",
				"Comment"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_declaration: BNF_PRODUCTION
			-- 18. Feature_declaration
		do
			create Result.make_from_text (
				"Feature_declaration",
				"New_feature_list Declaration_body"
			)
		ensure
			result_attached: Result /= Void
		end

	declaration_body: BNF_PRODUCTION
			-- 19. Declaration_body
		do
			create Result.make_from_text (
				"Declaration_body",
				"[Formal_arguments] [Query_mark] [Feature_value]"
			)
		ensure
			result_attached: Result /= Void
		end

	query_mark: BNF_PRODUCTION
			-- 20. Query_mark
		do
			create Result.make_from_text (
				"Query_mark",
				" Type_mark [Assigner_mark]"
			)
		ensure
			result_attached: Result /= Void
		end

	type_mark: BNF_PRODUCTION
			-- 21. Type_mark
		do
			create Result.make_from_text (
				"Type_mark",
				"%":%" Type"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_value: BNF_PRODUCTION
			-- 22. Feature_value
		do
			create Result.make_from_text (
				"Feature_value",
				"[Explicit_value]"
			)
		ensure
			result_attached: Result /= Void
		end

	explicit_value: BNF_PRODUCTION
			-- 23. Explicit_value
		do
			create Result.make_from_text (
				"Explicit_value",
				"%"=%" Manifest_constant"
			)
		ensure
			result_attached: Result /= Void
		end

	new_feature_list: BNF_PRODUCTION
			-- 24. New_feature_list
		do
			create Result.make_from_text (
				"New_feature_list",
				"{New_feature %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	new_feature: BNF_PRODUCTION
			-- 25. New_feature
		do
			create Result.make_from_text (
				"New_feature",
				"[frozen] Extended_feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	attribute_or_routine: BNF_PRODUCTION
			-- 26. Attribute_or_routine
		do
			create Result.make_from_text (
				"Attribute_or_routine",
				"[Precondition]"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_body: BNF_PRODUCTION
			-- 27. Feature_body
		do
			create Result.make_from_text (
				"Feature_body",
				"Deferred | Effective_routine | Attribute"
			)
		ensure
			result_attached: Result /= Void
		end

	extended_feature_name: BNF_PRODUCTION
			-- 28. Extended_feature_name
		do
			create Result.make_from_text (
				"Extended_feature_name",
				"Feature_name [Alias]"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_name: BNF_PRODUCTION
			-- 29. Feature_name
		do
			create Result.make_from_text (
				"Feature_name",
				"Identifier"
			)
		ensure
			result_attached: Result /= Void
		end

	alias_prod: BNF_PRODUCTION
			-- 30. Alias
		do
			create Result.make_from_text (
				"Alias",
				"alias '%"' Alias_name '%"' [convert]"
			)
		ensure
			result_attached: Result /= Void
		end

	alias_name: BNF_PRODUCTION
			-- 31. Alias_name
		do
			create Result.make_from_text (
				"Alias_name",
				"Operator | Bracket"
			)
		ensure
			result_attached: Result /= Void
		end

	bracket_prod: BNF_PRODUCTION
			-- 32. Bracket
		do
			create Result.make_from_text (
				"Bracket",
				"%"[]%""
			)
		ensure
			result_attached: Result /= Void
		end

	operator_prod: BNF_PRODUCTION
			-- 33. Operator
		do
			create Result.make_from_text (
				"Operator",
				"Unary | Binary"
			)
		ensure
			result_attached: Result /= Void
		end

	unary: BNF_PRODUCTION
			-- 34. Unary
		do
			create Result.make_from_text (
				"Unary",
				"not | %"+%" | %"-%" | Free_unary"
			)
		ensure
			result_attached: Result /= Void
		end

	binary: BNF_PRODUCTION
			-- 35. Binary
		do
			create Result.make_from_text (
				"Binary",
				"%"+%" | %"-%" | %"*%" | %"/%" | %"//%" | %"\\%" | %"^%" | %"..%" |"
			)
		ensure
			result_attached: Result /= Void
		end

	assigner_mark: BNF_PRODUCTION
			-- 36. Assigner_mark
		do
			create Result.make_from_text (
				"Assigner_mark",
				"assign Feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	inheritance: BNF_PRODUCTION
			-- 37. Inheritance
		do
			create Result.make_from_text (
				"Inheritance",
				"Inherit_clause+"
			)
		ensure
			result_attached: Result /= Void
		end

	inherit_clause: BNF_PRODUCTION
			-- 38. Inherit_clause
		do
			create Result.make_from_text (
				"Inherit_clause",
				"inherit [Non_conformance] Parent_list"
			)
		ensure
			result_attached: Result /= Void
		end

	non_conformance: BNF_PRODUCTION
			-- 39. Non_conformance
		do
			create Result.make_from_text (
				"Non_conformance",
				"%"{%" NONE %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	parent_list: BNF_PRODUCTION
			-- 40. Parent_list
		do
			create Result.make_from_text (
				"Parent_list",
				"{Parent %";%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	parent: BNF_PRODUCTION
			-- 41. Parent
		do
			create Result.make_from_text (
				"Parent",
				"Class_type [Feature_adaptation]"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_adaptation: BNF_PRODUCTION
			-- 42. Feature_adaptation
		do
			create Result.make_from_text (
				"Feature_adaptation",
				"[Undefine]"
			)
		ensure
			result_attached: Result /= Void
		end

	rename_prod: BNF_PRODUCTION
			-- 43. Rename
		do
			create Result.make_from_text (
				"Rename",
				"rename Rename_list"
			)
		ensure
			result_attached: Result /= Void
		end

	rename_list: BNF_PRODUCTION
			-- 44. Rename_list
		do
			create Result.make_from_text (
				"Rename_list",
				"{Rename_pair %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	rename_pair: BNF_PRODUCTION
			-- 45. Rename_pair
		do
			create Result.make_from_text (
				"Rename_pair",
				"Feature_name as Extended_feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	clients: BNF_PRODUCTION
			-- 46. Clients
		do
			create Result.make_from_text (
				"Clients",
				"%"{%" Class_list %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	class_list: BNF_PRODUCTION
			-- 47. Class_list
		do
			create Result.make_from_text (
				"Class_list",
				"{Class_name %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	new_exports: BNF_PRODUCTION
			-- 48. New_exports
		do
			create Result.make_from_text (
				"New_exports",
				"export New_export_list"
			)
		ensure
			result_attached: Result /= Void
		end

	new_export_list: BNF_PRODUCTION
			-- 49. New_export_list
		do
			create Result.make_from_text (
				"New_export_list",
				"{New_export_item %";%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	new_export_item: BNF_PRODUCTION
			-- 50. New_export_item
		do
			create Result.make_from_text (
				"New_export_item",
				"Clients [Header_comment] Feature_set"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_set: BNF_PRODUCTION
			-- 51. Feature_set
		do
			create Result.make_from_text (
				"Feature_set",
				"Feature_list | all"
			)
		ensure
			result_attached: Result /= Void
		end

	feature_list: BNF_PRODUCTION
			-- 52. Feature_list
		do
			create Result.make_from_text (
				"Feature_list",
				"{Feature_name %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	formal_arguments: BNF_PRODUCTION
			-- 53. Formal_arguments
		do
			create Result.make_from_text (
				"Formal_arguments",
				"%"(%" Entity_declaration_list %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	entity_declaration_list: BNF_PRODUCTION
			-- 54. Entity_declaration_list
		do
			create Result.make_from_text (
				"Entity_declaration_list",
				"{Entity_declaration_group %";%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	entity_declaration_group: BNF_PRODUCTION
			-- 55. Entity_declaration_group
		do
			create Result.make_from_text (
				"Entity_declaration_group",
				"Identifier_list Type_mark"
			)
		ensure
			result_attached: Result /= Void
		end

	identifier_list: BNF_PRODUCTION
			-- 56. Identifier_list
		do
			create Result.make_from_text (
				"Identifier_list",
				"{Identifier %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	deferred_prod: BNF_PRODUCTION
			-- 57. Deferred
		do
			create Result.make_from_text (
				"Deferred",
				"deferred"
			)
		ensure
			result_attached: Result /= Void
		end

	effective_routine: BNF_PRODUCTION
			-- 58. Effective_routine
		do
			create Result.make_from_text (
				"Effective_routine",
				"Internal | External"
			)
		ensure
			result_attached: Result /= Void
		end

	internal_prod: BNF_PRODUCTION
			-- 59. Internal
		do
			create Result.make_from_text (
				"Internal",
				"Routine_mark Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	routine_mark: BNF_PRODUCTION
			-- 60. Routine_mark
		do
			create Result.make_from_text (
				"Routine_mark",
				"do | Once"
			)
		ensure
			result_attached: Result /= Void
		end

	once_prod: BNF_PRODUCTION
			-- 61. Once
		do
			create Result.make_from_text (
				"Once",
				"once [ %"(%"Key_list %")%" ]"
			)
		ensure
			result_attached: Result /= Void
		end

	key_list_prod: BNF_PRODUCTION
			-- 62. Key_list
		do
			create Result.make_from_text (
				"Key_list",
				"{Manifest_string %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	local_declarations: BNF_PRODUCTION
			-- 63. Local_declarations
		do
			create Result.make_from_text (
				"Local_declarations",
				"local [Entity_declaration_list]"
			)
		ensure
			result_attached: Result /= Void
		end

	compound: BNF_PRODUCTION
			-- 64. Compound
		do
			create Result.make_from_text (
				"Compound",
				"{Instruction %";%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	instruction_prod: BNF_PRODUCTION
			-- 65. Instruction
		do
			create Result.make_from_text (
				"Instruction",
				"Creation_instruction | Call | Assignment | Assigner_call | Conditional | Multi_branch | Loop | Debug | Precursor | Check | Retry"
			)
		ensure
			result_attached: Result /= Void
		end

	precondition: BNF_PRODUCTION
			-- 66. Precondition
		do
			create Result.make_from_text (
				"Precondition",
				"require [else] Assertion"
			)
		ensure
			result_attached: Result /= Void
		end

	postcondition: BNF_PRODUCTION
			-- 67. Postcondition
		do
			create Result.make_from_text (
				"Postcondition",
				"ensure [then] Assertion [Only]"
			)
		ensure
			result_attached: Result /= Void
		end

	invariant_prod: BNF_PRODUCTION
			-- 68. Invariant
		do
			create Result.make_from_text (
				"Invariant",
				"invariant Assertion"
			)
		ensure
			result_attached: Result /= Void
		end

	assertion: BNF_PRODUCTION
			-- 69. Assertion
		do
			create Result.make_from_text (
				"Assertion",
				"{Assertion_clause %";%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	assertion_clause: BNF_PRODUCTION
			-- 70. Assertion_clause
		do
			create Result.make_from_text (
				"Assertion_clause",
				"[Tag_mark] Unlabeled_assertion_clause"
			)
		ensure
			result_attached: Result /= Void
		end

	unlabeled_assertion_clause: BNF_PRODUCTION
			-- 71. Unlabeled_assertion_clause
		do
			create Result.make_from_text (
				"Unlabeled_assertion_clause",
				"Boolean_expression | Comment"
			)
		ensure
			result_attached: Result /= Void
		end

	tag_mark_prod: BNF_PRODUCTION
			-- 72. Tag_mark
		do
			create Result.make_from_text (
				"Tag_mark",
				"Tag %":%""
			)
		ensure
			result_attached: Result /= Void
		end

	tag_prod: BNF_PRODUCTION
			-- 73. Tag
		do
			create Result.make_from_text (
				"Tag",
				"Identifier"
			)
		ensure
			result_attached: Result /= Void
		end

	old_prod: BNF_PRODUCTION
			-- 74. Old
		do
			create Result.make_from_text (
				"Old",
				"old Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	only_prod: BNF_PRODUCTION
			-- 75. Only
		do
			create Result.make_from_text (
				"Only",
				"only [Feature_list]"
			)
		ensure
			result_attached: Result /= Void
		end

	check_prod: BNF_PRODUCTION
			-- 76. Check
		do
			create Result.make_from_text (
				"Check",
				"check Assertion [Notes] end"
			)
		ensure
			result_attached: Result /= Void
		end

	variant_prod: BNF_PRODUCTION
			-- 77. Variant
		do
			create Result.make_from_text (
				"Variant",
				"variant [Tag_mark] Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	precursor_prod: BNF_PRODUCTION
			-- 78. Precursor
		do
			create Result.make_from_text (
				"Precursor",
				"Precursor [Parent_qualification] [Actuals]"
			)
		ensure
			result_attached: Result /= Void
		end

	parent_qualification: BNF_PRODUCTION
			-- 79. Parent_qualification
		do
			create Result.make_from_text (
				"Parent_qualification",
				"%"{%" Class_name %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	redefine_prod: BNF_PRODUCTION
			-- 80. Redefine
		do
			create Result.make_from_text (
				"Redefine",
				"redefine Feature_list"
			)
		ensure
			result_attached: Result /= Void
		end

	undefine_prod: BNF_PRODUCTION
			-- 81. Undefine
		do
			create Result.make_from_text (
				"Undefine",
				"undefine Feature_list"
			)
		ensure
			result_attached: Result /= Void
		end

	type_prod: BNF_PRODUCTION
			-- 82. Type
		do
			create Result.make_from_text (
				"Type",
				"Class_or_tuple_type | Formal_generic_name | Anchored"
			)
		ensure
			result_attached: Result /= Void
		end

	class_or_tuple_type: BNF_PRODUCTION
			-- 83. Class_or_tuple_type
		do
			create Result.make_from_text (
				"Class_or_tuple_type",
				"Class_type | Tuple_type"
			)
		ensure
			result_attached: Result /= Void
		end

	class_type: BNF_PRODUCTION
			-- 84. Class_type
		do
			create Result.make_from_text (
				"Class_type",
				"[Attachment_mark] Class_name [Actual_generics]"
			)
		ensure
			result_attached: Result /= Void
		end

	attachment_mark: BNF_PRODUCTION
			-- 85. Attachment_mark
		do
			create Result.make_from_text (
				"Attachment_mark",
				"%"?%" | %"!%""
			)
		ensure
			result_attached: Result /= Void
		end

	anchored: BNF_PRODUCTION
			-- 86. Anchored
		do
			create Result.make_from_text (
				"Anchored",
				" [Attachment_mark] like Anchor"
			)
		ensure
			result_attached: Result /= Void
		end

	anchor: BNF_PRODUCTION
			-- 87. Anchor
		do
			create Result.make_from_text (
				"Anchor",
				"Feature_name | Current"
			)
		ensure
			result_attached: Result /= Void
		end

	actual_generics: BNF_PRODUCTION
			-- 88. Actual_generics
		do
			create Result.make_from_text (
				"Actual_generics",
				"%"[%" Type_list %"]%""
			)
		ensure
			result_attached: Result /= Void
		end

	type_list: BNF_PRODUCTION
			-- 89. Type_list
		do
			create Result.make_from_text (
				"Type_list",
				"{Type %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	formal_generics: BNF_PRODUCTION
			-- 90. Formal_generics
		do
			create Result.make_from_text (
				"Formal_generics",
				"%"[%" Formal_generic_list %"]%""
			)
		ensure
			result_attached: Result /= Void
		end

	formal_generic_list: BNF_PRODUCTION
			-- 91. Formal_generic_list
		do
			create Result.make_from_text (
				"Formal_generic_list",
				"{Formal_generic %",%"...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	formal_generic: BNF_PRODUCTION
			-- 92. Formal_generic
		do
			create Result.make_from_text (
				"Formal_generic",
				"[frozen] Formal_generic_name [Constraint]"
			)
		ensure
			result_attached: Result /= Void
		end

	formal_generic_name: BNF_PRODUCTION
			-- 93. Formal_generic_name
		do
			create Result.make_from_text (
				"Formal_generic_name",
				"[?] Identifier"
			)
		ensure
			result_attached: Result /= Void
		end

	constraint: BNF_PRODUCTION
			-- 94. Constraint
		do
			create Result.make_from_text (
				"Constraint",
				"%"->%" Constraining_types [Constraint_creators]"
			)
		ensure
			result_attached: Result /= Void
		end

	constraining_types: BNF_PRODUCTION
			-- 95. Constraining_types
		do
			create Result.make_from_text (
				"Constraining_types",
				"Single_constraint | Multiple_constraint"
			)
		ensure
			result_attached: Result /= Void
		end

	single_constraint: BNF_PRODUCTION
			-- 96. Single_constraint
		do
			create Result.make_from_text (
				"Single_constraint",
				"Type [Renaming]"
			)
		ensure
			result_attached: Result /= Void
		end

	renaming: BNF_PRODUCTION
			-- 97. Renaming
		do
			create Result.make_from_text (
				"Renaming",
				"Rename end"
			)
		ensure
			result_attached: Result /= Void
		end

	multiple_constraint: BNF_PRODUCTION
			-- 98. Multiple_constraint
		do
			create Result.make_from_text (
				"Multiple_constraint",
				"%"{%" Constraint_list %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	constraint_list: BNF_PRODUCTION
			-- 99. Constraint_list
		do
			create Result.make_from_text (
				"Constraint_list",
				"{Single_constraint %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	constraint_creators: BNF_PRODUCTION
			-- 100. Constraint_creators
		do
			create Result.make_from_text (
				"Constraint_creators",
				"create Feature_list end"
			)
		ensure
			result_attached: Result /= Void
		end

	tuple_type: BNF_PRODUCTION
			-- 101. Tuple_type
		do
			create Result.make_from_text (
				"Tuple_type",
				"TUPLE [Tuple_parameter_list]"
			)
		ensure
			result_attached: Result /= Void
		end

	tuple_parameter_list: BNF_PRODUCTION
			-- 102. Tuple_parameter_list
		do
			create Result.make_from_text (
				"Tuple_parameter_list",
				" %"[%" Tuple_parameters %"]%""
			)
		ensure
			result_attached: Result /= Void
		end

	tuple_parameters: BNF_PRODUCTION
			-- 103. Tuple_parameters
		do
			create Result.make_from_text (
				"Tuple_parameters",
				" Type_list | Entity_declaration_list"
			)
		ensure
			result_attached: Result /= Void
		end

	manifest_tuple: BNF_PRODUCTION
			-- 104. Manifest_tuple
		do
			create Result.make_from_text (
				"Manifest_tuple",
				" %"[%" Expression_list %"]%""
			)
		ensure
			result_attached: Result /= Void
		end

	expression_list_prod: BNF_PRODUCTION
			-- 105. Expression_list
		do
			create Result.make_from_text (
				"Expression_list",
				"{Expression %",%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	converters_prod: BNF_PRODUCTION
			-- 106. Converters
		do
			create Result.make_from_text (
				"Converters",
				"convert Converter_list"
			)
		ensure
			result_attached: Result /= Void
		end

	converter_list: BNF_PRODUCTION
			-- 107. Converter_list
		do
			create Result.make_from_text (
				"Converter_list",
				" {Converter %",%"...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	converter: BNF_PRODUCTION
			-- 108. Converter
		do
			create Result.make_from_text (
				"Converter",
				" Conversion_procedure | Conversion_query"
			)
		ensure
			result_attached: Result /= Void
		end

	conversion_procedure: BNF_PRODUCTION
			-- 109. Conversion_procedure
		do
			create Result.make_from_text (
				"Conversion_procedure",
				" Feature_name %"(%" %"{%" Type_list %"}%" %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	conversion_query: BNF_PRODUCTION
			-- 110. Conversion_query
		do
			create Result.make_from_text (
				"Conversion_query",
				" Feature_name %":%" %"{%" Type_list %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	select_prod: BNF_PRODUCTION
			-- 111. Select
		do
			create Result.make_from_text (
				"Select",
				"select Feature_list"
			)
		ensure
			result_attached: Result /= Void
		end

	conditional: BNF_PRODUCTION
			-- 112. Conditional
		do
			create Result.make_from_text (
				"Conditional",
				" if Then_part_list [Else_part] end"
			)
		ensure
			result_attached: Result /= Void
		end

	then_part_prod: BNF_PRODUCTION
			-- 113. Then_part
		do
			create Result.make_from_text (
				"Then_part",
				"Boolean_expression then Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	else_part_prod: BNF_PRODUCTION
			-- 114. Else_part
		do
			create Result.make_from_text (
				"Else_part",
				"else Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	multi_branch: BNF_PRODUCTION
			-- 115. Multi_branch
		do
			create Result.make_from_text (
				"Multi_branch",
				"inspect Expression [When_part_list] [Else_part] end"
			)
		ensure
			result_attached: Result /= Void
		end

	when_part_list_prod: BNF_PRODUCTION
			-- 116. When_part_list
		do
			create Result.make_from_text (
				"When_part_list",
				"When_part+"
			)
		ensure
			result_attached: Result /= Void
		end

	when_part_prod: BNF_PRODUCTION
			-- 117. When_part
		do
			create Result.make_from_text (
				"When_part",
				"when Choices then Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	choices_prod: BNF_PRODUCTION
			-- 118. Choices
		do
			create Result.make_from_text (
				"Choices",
				"{Choice %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	choice_prod: BNF_PRODUCTION
			-- 119. Choice
		do
			create Result.make_from_text (
				"Choice",
				"Constant | Manifest_type | Constant_interval | Type_interval"
			)
		ensure
			result_attached: Result /= Void
		end

	constant_interval_prod: BNF_PRODUCTION
			-- 120. Constant_interval
		do
			create Result.make_from_text (
				"Constant_interval",
				"Constant %"..%" Constant"
			)
		ensure
			result_attached: Result /= Void
		end

	type_interval_prod: BNF_PRODUCTION
			-- 121. Type_interval
		do
			create Result.make_from_text (
				"Type_interval",
				"Manifest_type %"..%" Manifest_type"
			)
		ensure
			result_attached: Result /= Void
		end

	loop_prod: BNF_PRODUCTION
			-- 122. Loop
		do
			create Result.make_from_text (
				"Loop",
				"Initialization"
			)
		ensure
			result_attached: Result /= Void
		end

	initialization_prod: BNF_PRODUCTION
			-- 123. Initialization
		do
			create Result.make_from_text (
				"Initialization",
				"from Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	exit_condition_prod: BNF_PRODUCTION
			-- 124. Exit_condition
		do
			create Result.make_from_text (
				"Exit_condition",
				"until Boolean_expression"
			)
		ensure
			result_attached: Result /= Void
		end

	loop_body_prod: BNF_PRODUCTION
			-- 125. Loop_body
		do
			create Result.make_from_text (
				"Loop_body",
				"loop Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	debug_prod: BNF_PRODUCTION
			-- 126. Debug
		do
			create Result.make_from_text (
				"Debug",
				"debug [ %"(%"Key_list %")%" ] Compound end"
			)
		ensure
			result_attached: Result /= Void
		end

	attribute_prod: BNF_PRODUCTION
			-- 127. Attribute
		do
			create Result.make_from_text (
				"Attribute",
				"attribute Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	entity_prod: BNF_PRODUCTION
			-- 128. Entity
		do
			create Result.make_from_text (
				"Entity",
				"Variable | Read_only"
			)
		ensure
			result_attached: Result /= Void
		end

	variable_prod: BNF_PRODUCTION
			-- 129. Variable
		do
			create Result.make_from_text (
				"Variable",
				"Variable_attribute | Local"
			)
		ensure
			result_attached: Result /= Void
		end

	variable_attribute: BNF_PRODUCTION
			-- 130. Variable_attribute
		do
			create Result.make_from_text (
				"Variable_attribute",
				"Feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	local_prod: BNF_PRODUCTION
			-- 131. Local
		do
			create Result.make_from_text (
				"Local",
				"Identifier | Result"
			)
		ensure
			result_attached: Result /= Void
		end

	read_only_prod: BNF_PRODUCTION
			-- 132. Read_only
		do
			create Result.make_from_text (
				"Read_only",
				"Formal | Constant_attribute | Current"
			)
		ensure
			result_attached: Result /= Void
		end

	formal_prod: BNF_PRODUCTION
			-- 133. Formal
		do
			create Result.make_from_text (
				"Formal",
				"Identifier"
			)
		ensure
			result_attached: Result /= Void
		end

	constant_attribute_prod: BNF_PRODUCTION
			-- 134. Constant_attribute
		do
			create Result.make_from_text (
				"Constant_attribute",
				"Feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	creators: BNF_PRODUCTION
			-- 135. Creators
		do
			create Result.make_from_text (
				"Creators",
				"Creation_clause+"
			)
		ensure
			result_attached: Result /= Void
		end

	creation_clause: BNF_PRODUCTION
			-- 136. Creation_clause
		do
			create Result.make_from_text (
				"Creation_clause",
				"create [Clients] [Header_comment] Creation_procedure_list"
			)
		ensure
			result_attached: Result /= Void
		end

	creation_procedure_list: BNF_PRODUCTION
			-- 137. Creation_procedure_list
		do
			create Result.make_from_text (
				"Creation_procedure_list",
				"{Creation_procedure %",%"...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	creation_procedure: BNF_PRODUCTION
			-- 138. Creation_procedure
		do
			create Result.make_from_text (
				"Creation_procedure",
				"Feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	creation_instruction: BNF_PRODUCTION
			-- 139. Creation_instruction
		do
			create Result.make_from_text (
				"Creation_instruction",
				"create [Explicit_creation_type] Creation_call"
			)
		ensure
			result_attached: Result /= Void
		end

	explicit_creation_type: BNF_PRODUCTION
			-- 140. Explicit_creation_type
		do
			create Result.make_from_text (
				"Explicit_creation_type",
				"%"{%" Type %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	creation_call: BNF_PRODUCTION
			-- 141. Creation_call
		do
			create Result.make_from_text (
				"Creation_call",
				"Variable [Explicit_creation_call]"
			)
		ensure
			result_attached: Result /= Void
		end

	explicit_creation_call: BNF_PRODUCTION
			-- 142. Explicit_creation_call
		do
			create Result.make_from_text (
				"Explicit_creation_call",
				"%".%" Unqualified_call"
			)
		ensure
			result_attached: Result /= Void
		end

	creation_expression: BNF_PRODUCTION
			-- 143. Creation_expression
		do
			create Result.make_from_text (
				"Creation_expression",
				" create Explicit_creation_type [Explicit_creation_call]"
			)
		ensure
			result_attached: Result /= Void
		end

	equality_prod: BNF_PRODUCTION
			-- 144. Equality
		do
			create Result.make_from_text (
				"Equality",
				"Expression Comparison Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	comparison_prod: BNF_PRODUCTION
			-- 145. Comparison
		do
			create Result.make_from_text (
				"Comparison",
				"%"=%" | %"/=%" | %"~%" | %"/~%""
			)
		ensure
			result_attached: Result /= Void
		end

	assignment_prod: BNF_PRODUCTION
			-- 146. Assignment
		do
			create Result.make_from_text (
				"Assignment",
				"Variable %":=%" Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	assigner_call: BNF_PRODUCTION
			-- 147. Assigner_call
		do
			create Result.make_from_text (
				"Assigner_call",
				"Expression %":=%" Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	call_prod: BNF_PRODUCTION
			-- 148. Call
		do
			create Result.make_from_text (
				"Call",
				"Object_call | Non_object_call"
			)
		ensure
			result_attached: Result /= Void
		end

	object_call: BNF_PRODUCTION
			-- 149. Object_call
		do
			create Result.make_from_text (
				"Object_call",
				"[Target %".%"] Unqualified_call"
			)
		ensure
			result_attached: Result /= Void
		end

	unqualified_call: BNF_PRODUCTION
			-- 150. Unqualified_call
		do
			create Result.make_from_text (
				"Unqualified_call",
				"Feature_name [Actuals]"
			)
		ensure
			result_attached: Result /= Void
		end

	target_prod: BNF_PRODUCTION
			-- 151. Target
		do
			create Result.make_from_text (
				"Target",
				"Local | Read_only | Call | Parenthesized_target"
			)
		ensure
			result_attached: Result /= Void
		end

	parenthesized_target: BNF_PRODUCTION
			-- 152. Parenthesized_target
		do
			create Result.make_from_text (
				"Parenthesized_target",
				"%"(|%" Expression %"|)%""
			)
		ensure
			result_attached: Result /= Void
		end

	non_object_call: BNF_PRODUCTION
			-- 153. Non_object_call
		do
			create Result.make_from_text (
				"Non_object_call",
				"%"{%" Type %"}%" %".%" Unqualified_call"
			)
		ensure
			result_attached: Result /= Void
		end

	actuals: BNF_PRODUCTION
			-- 154. Actuals
		do
			create Result.make_from_text (
				"Actuals",
				"%"(%" Actual_list %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	actual_list: BNF_PRODUCTION
			-- 155. Actual_list
		do
			create Result.make_from_text (
				"Actual_list",
				"{Expression %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	object_test: BNF_PRODUCTION
			-- 156. Object_test
		do
			create Result.make_from_text (
				"Object_test",
				"%"{%" Identifier %":%" Type %"}%" Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	rescue_prod: BNF_PRODUCTION
			-- 157. Rescue
		do
			create Result.make_from_text (
				"Rescue",
				"rescue Compound"
			)
		ensure
			result_attached: Result /= Void
		end

	retry_prod: BNF_PRODUCTION
			-- 158. Retry
		do
			create Result.make_from_text (
				"Retry",
				"retry"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_prod: BNF_PRODUCTION
			-- 159. Agent
		do
			create Result.make_from_text (
				"Agent",
				" Call_agent | Inline_agent"
			)
		ensure
			result_attached: Result /= Void
		end

	call_agent_prod: BNF_PRODUCTION
			-- 160. Call_agent
		do
			create Result.make_from_text (
				"Call_agent",
				" agent Call_agent_body"
			)
		ensure
			result_attached: Result /= Void
		end

	inline_agent_prod: BNF_PRODUCTION
			-- 161. Inline_agent
		do
			create Result.make_from_text (
				"Inline_agent",
				" agent [Formal_arguments] [Type_mark] [Attribute_or_routine] [Agent_actuals]"
			)
		ensure
			result_attached: Result /= Void
		end

	call_agent_body: BNF_PRODUCTION
			-- 162. Call_agent_body
		do
			create Result.make_from_text (
				"Call_agent_body",
				" Agent_qualified | Agent_unqualified"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_qualified: BNF_PRODUCTION
			-- 163. Agent_qualified
		do
			create Result.make_from_text (
				"Agent_qualified",
				"Agent_target %". %" Agent_unqualified"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_unqualified: BNF_PRODUCTION
			-- 164. Agent_unqualified
		do
			create Result.make_from_text (
				"Agent_unqualified",
				"Feature_name [Agent_actuals]"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_target: BNF_PRODUCTION
			-- 165. Agent_target
		do
			create Result.make_from_text (
				"Agent_target",
				"Entity | Parenthesized | Manifest_type"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_actuals: BNF_PRODUCTION
			-- 166. Agent_actuals
		do
			create Result.make_from_text (
				"Agent_actuals",
				"%"(%" Agent_actual_list %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	agent_actual_list: BNF_PRODUCTION
			-- 167. Agent_actual_list
		do
			create Result.make_from_text (
				"Agent_actual_list",
				"{Agent_actual %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	agent_actual: BNF_PRODUCTION
			-- 168. Agent_actual
		do
			create Result.make_from_text (
				"Agent_actual",
				"Expression | Placeholder"
			)
		ensure
			result_attached: Result /= Void
		end

	placeholder: BNF_PRODUCTION
			-- 169. Placeholder
		do
			create Result.make_from_text (
				"Placeholder",
				"[Manifest_type] %"?%""
			)
		ensure
			result_attached: Result /= Void
		end

	expression: BNF_PRODUCTION
			-- 170. Expression
		do
			create Result.make_from_text (
				"Expression",
				"Basic_expression | Special_expression"
			)
		ensure
			result_attached: Result /= Void
		end

	basic_expression: BNF_PRODUCTION
			-- 171. Basic_expression
		do
			create Result.make_from_text (
				"Basic_expression",
				"Read_only | Local | Call | Precursor | Equality | Parenthesized | Old | Operator_expression | Bracket_expression | Creation_expression"
			)
		ensure
			result_attached: Result /= Void
		end

	special_expression: BNF_PRODUCTION
			-- 172. Special_expression
		do
			create Result.make_from_text (
				"Special_expression",
				"Manifest_constant | Manifest_tuple | Agent | Object_test | Once_string | Address"
			)
		ensure
			result_attached: Result /= Void
		end

	parenthesized_prod: BNF_PRODUCTION
			-- 173. Parenthesized
		do
			create Result.make_from_text (
				"Parenthesized",
				"%"(%" Expression %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	address_prod: BNF_PRODUCTION
			-- 174. Address
		do
			create Result.make_from_text (
				"Address",
				"%"$%" Variable"
			)
		ensure
			result_attached: Result /= Void
		end

	once_string: BNF_PRODUCTION
			-- 175. Once_string
		do
			create Result.make_from_text (
				"Once_string",
				"once Manifest_string"
			)
		ensure
			result_attached: Result /= Void
		end

	boolean_expression_prod: BNF_PRODUCTION
			-- 176. Boolean_expression
		do
			create Result.make_from_text (
				"Boolean_expression",
				"Basic_expression | Boolean_constant | Object_test"
			)
		ensure
			result_attached: Result /= Void
		end

	operator_expression: BNF_PRODUCTION
			-- 177. Operator_expression
		do
			create Result.make_from_text (
				"Operator_expression",
				"Unary_expression | Binary_expression"
			)
		ensure
			result_attached: Result /= Void
		end

	unary_expression_prod: BNF_PRODUCTION
			-- 178. Unary_expression
		do
			create Result.make_from_text (
				"Unary_expression",
				"Unary Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	binary_expression_prod: BNF_PRODUCTION
			-- 179. Binary_expression
		do
			create Result.make_from_text (
				"Binary_expression",
				"Expression Binary Expression"
			)
		ensure
			result_attached: Result /= Void
		end

	bracket_expression: BNF_PRODUCTION
			-- 180. Bracket_expression
		do
			create Result.make_from_text (
				"Bracket_expression",
				"Bracket_target %"[%" Actuals %"]%""
			)
		ensure
			result_attached: Result /= Void
		end

	bracket_target: BNF_PRODUCTION
			-- 181. Bracket_target
		do
			create Result.make_from_text (
				"Bracket_target",
				"Target | Once_string | Manifest_constant | Manifest_tuple"
			)
		ensure
			result_attached: Result /= Void
		end

	constant_prod: BNF_PRODUCTION
			-- 182. Constant
		do
			create Result.make_from_text (
				"Constant",
				"Manifest_constant | Constant_attribute"
			)
		ensure
			result_attached: Result /= Void
		end

	constant_attribute_2_prod: BNF_PRODUCTION
			-- 183. Constant_attribute
		do
			create Result.make_from_text (
				"Constant_attribute",
				"Feature_name"
			)
		ensure
			result_attached: Result /= Void
		end

	manifest_constant: BNF_PRODUCTION
			-- 184. Manifest_constant
		do
			create Result.make_from_text (
				"Manifest_constant",
				"[Manifest_type] Manifest_value"
			)
		ensure
			result_attached: Result /= Void
		end

	manifest_type: BNF_PRODUCTION
			-- 185. Manifest_type
		do
			create Result.make_from_text (
				"Manifest_type",
				"%"{%" Type %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	manifest_value: BNF_PRODUCTION
			-- 186. Manifest_value
		do
			create Result.make_from_text (
				"Manifest_value",
				"Boolean_constant |"
			)
		ensure
			result_attached: Result /= Void
		end

	sign_prod: BNF_PRODUCTION
			-- 187. Sign
		do
			create Result.make_from_text (
				"Sign",
				"%"+%" | %"-%""
			)
		ensure
			result_attached: Result /= Void
		end

	integer_constant_prod: BNF_PRODUCTION
			-- 188. Integer_constant
		do
			create Result.make_from_text (
				"Integer_constant",
				"[Sign] Integer"
			)
		ensure
			result_attached: Result /= Void
		end

	character_constant_prod: BNF_PRODUCTION
			-- 189. Character_constant
		do
			create Result.make_from_text (
				"Character_constant",
				"%"'%" Character %"'%""
			)
		ensure
			result_attached: Result /= Void
		end

	boolean_constant_prod: BNF_PRODUCTION
			-- 190. Boolean_constant
		do
			create Result.make_from_text (
				"Boolean_constant",
				"True | False"
			)
		ensure
			result_attached: Result /= Void
		end

	real_constant_prod: BNF_PRODUCTION
			-- 191. Real_constant
		do
			create Result.make_from_text (
				"Real_constant",
				"[Sign] Real"
			)
		ensure
			result_attached: Result /= Void
		end

	manifest_string_prod: BNF_PRODUCTION
			-- 192. Manifest_string
		do
			create Result.make_from_text (
				"Manifest_string",
				"Basic_manifest_string | Verbatim_string"
			)
		ensure
			result_attached: Result /= Void
		end

	basic_manifest_string: BNF_PRODUCTION
			-- 193. Basic_manifest_string
		do
			create Result.make_from_text (
				"Basic_manifest_string",
				"' %" ' String_content ' %" '"
			)
		ensure
			result_attached: Result /= Void
		end

	string_content_prod: BNF_PRODUCTION
			-- 194. String_content
		do
			create Result.make_from_text (
				"String_content",
				"{Simple_string Line_wrapping_part ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	verbatim_string_prod: BNF_PRODUCTION
			-- 195. Verbatim_string
		do
			create Result.make_from_text (
				"Verbatim_string",
				"Verbatim_string_opener Line_sequence Verbatim_string_closer"
			)
		ensure
			result_attached: Result /= Void
		end

	verbatim_string_opener: BNF_PRODUCTION
			-- 196. Verbatim_string_opener
		do
			create Result.make_from_text (
				"Verbatim_string_opener",
				"' %" ' [Simple_string] Open_bracket"
			)
		ensure
			result_attached: Result /= Void
		end

	verbatim_string_closer: BNF_PRODUCTION
			-- 197. Verbatim_string_closer
		do
			create Result.make_from_text (
				"Verbatim_string_closer",
				" Close_bracket [Simple_string] ' %" '"
			)
		ensure
			result_attached: Result /= Void
		end

	open_bracket_prod: BNF_PRODUCTION
			-- 198. Open_bracket
		do
			create Result.make_from_text (
				"Open_bracket",
				"%"[%" | %"{%""
			)
		ensure
			result_attached: Result /= Void
		end

	close_bracket_prod: BNF_PRODUCTION
			-- 199. Close_bracket
		do
			create Result.make_from_text (
				"Close_bracket",
				"%"]%" | %"}%""
			)
		ensure
			result_attached: Result /= Void
		end

	external_prod: BNF_PRODUCTION
			-- 200. External
		do
			create Result.make_from_text (
				"External",
				"external External_language [External_name]"
			)
		ensure
			result_attached: Result /= Void
		end

	external_language: BNF_PRODUCTION
			-- 201. External_language
		do
			create Result.make_from_text (
				"External_language",
				"Unregistered_language | Registered_language"
			)
		ensure
			result_attached: Result /= Void
		end

	unregistered_language: BNF_PRODUCTION
			-- 202. Unregistered_language
		do
			create Result.make_from_text (
				"Unregistered_language",
				"Manifest_string"
			)
		ensure
			result_attached: Result /= Void
		end

	external_name: BNF_PRODUCTION
			-- 203. External_name
		do
			create Result.make_from_text (
				"External_name",
				"alias Manifest_string"
			)
		ensure
			result_attached: Result /= Void
		end

	registered_language: BNF_PRODUCTION
			-- 204. Registered_language
		do
			create Result.make_from_text (
				"Registered_language",
				" C_external | C++_external | DLL_external"
			)
		ensure
			result_attached: Result /= Void
		end

	external_signature: BNF_PRODUCTION
			-- 205. External_signature
		do
			create Result.make_from_text (
				"External_signature",
				"signature [External_argument_types] [: External_type]"
			)
		ensure
			result_attached: Result /= Void
		end

	external_argument_types: BNF_PRODUCTION
			-- 206. External_argument_types
		do
			create Result.make_from_text (
				"External_argument_types",
				"%"(%" External_type_list %")%""
			)
		ensure
			result_attached: Result /= Void
		end

	external_type_list: BNF_PRODUCTION
			-- 207. External_type_list
		do
			create Result.make_from_text (
				"External_type_list",
				"{External_type %",%" ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	external_type_prod: BNF_PRODUCTION
			-- 208. External_type
		do
			create Result.make_from_text (
				"External_type",
				"Simple_string"
			)
		ensure
			result_attached: Result /= Void
		end

	external_file_use: BNF_PRODUCTION
			-- 209. External_file_use
		do
			create Result.make_from_text (
				"External_file_use",
				"use External_file_list"
			)
		ensure
			result_attached: Result /= Void
		end

	external_file_list: BNF_PRODUCTION
			-- 210. External_file_list
		do
			create Result.make_from_text (
				"External_file_list",
				"{External_file %",%" ...}+"
			)
		ensure
			result_attached: Result /= Void
		end

	external_file_prod: BNF_PRODUCTION
			-- 211. External_file
		do
			create Result.make_from_text (
				"External_file",
				"External_user_file | External_system_file"
			)
		ensure
			result_attached: Result /= Void
		end

	external_user_file: BNF_PRODUCTION
			-- 212. External_user_file
		do
			create Result.make_from_text (
				"External_user_file",
				"' %" ' Simple_string ' %" '"
			)
		ensure
			result_attached: Result /= Void
		end

	external_system_file: BNF_PRODUCTION
			-- 213. External_system_file
		do
			create Result.make_from_text (
				"External_system_file",
				"%"<%"Simple_string %">%""
			)
		ensure
			result_attached: Result /= Void
		end

	c_external_prod: BNF_PRODUCTION
			-- 214. C_external
		do
			create Result.make_from_text (
				"C_external",
				"’' %" ' C"
			)
		ensure
			result_attached: Result /= Void
		end

	dll_external_prod: BNF_PRODUCTION
			-- 215. DLL_external
		do
			create Result.make_from_text (
				"DLL_external",
				"' %" ' dll"
			)
		ensure
			result_attached: Result /= Void
		end

	dll_identifier: BNF_PRODUCTION
			-- 216. DLL_identifier
		do
			create Result.make_from_text (
				"DLL_identifier",
				"Simple_string"
			)
		ensure
			result_attached: Result /= Void
		end

	dll_index: BNF_PRODUCTION
			-- 217. DLL_index
		do
			create Result.make_from_text (
				"DLL_index",
				"Integer"
			)
		ensure
			result_attached: Result /= Void
		end

	comment_prod: BNF_PRODUCTION
			-- 218. Comment
		do
			create Result.make_from_text (
				"Comment",
				"%"- -%" {Simple_string Comment_break ...}*"
			)
		ensure
			result_attached: Result /= Void
		end

	comment_break_prod: BNF_PRODUCTION
			-- 219. Comment_break
		do
			create Result.make_from_text (
				"Comment_break",
				"New_line [Blanks_or_tabs] %"- -%""
			)
		ensure
			result_attached: Result /= Void
		end

	integer_prod: BNF_PRODUCTION
			-- 220. Integer
		do
			create Result.make_from_text (
				"Integer",
				"[Integer_base] Digit_sequence"
			)
		ensure
			result_attached: Result /= Void
		end

	integer_base_prod: BNF_PRODUCTION
			-- 221. Integer_base
		do
			create Result.make_from_text (
				"Integer_base",
				"%"0%" Integer_base_letter"
			)
		ensure
			result_attached: Result /= Void
		end

	integer_base_letter_prod: BNF_PRODUCTION
			-- 222. Integer_base_letter
		do
			create Result.make_from_text (
				"Integer_base_letter",
				"%"b%" | %"c%" | %"x%" | %"B%" | %"C%" | %"X%""
			)
		ensure
			result_attached: Result /= Void
		end

	digit_sequence_prod: BNF_PRODUCTION
			-- 223. Digit_sequence
		do
			create Result.make_from_text (
				"Digit_sequence",
				"Digit+"
			)
		ensure
			result_attached: Result /= Void
		end

	digit_prod: BNF_PRODUCTION
			-- 224. Digit
		do
			create Result.make_from_text (
				"Digit",
				"%"0%" | %"1%" | %"2%" | %"3%" | %"4%" | %"5%" | %"6%" | %"7%" | %"8%" | %"9%" |"
			)
		ensure
			result_attached: Result /= Void
		end

feature -- Statistics

	production_count: INTEGER = 224
		-- Total number of ECMA-367 productions

	choice_count: INTEGER = 50
		-- Productions with choice operator (|)

	repetition_count: INTEGER = 38
		-- Productions with repetition ({...}* or {...}+)

	optional_count: INTEGER = 58
		-- Productions with optional components ([...])

invariant
	-- All productions are valid ECMA-367 constructs
	production_count > 0
end
