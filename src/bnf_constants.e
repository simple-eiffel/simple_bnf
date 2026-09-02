note
	description: "[
		Curated regex constants for matching Eiffel language constructs.
		Patterns follow ECMA-367 syntax definitions and are validated
		against SIMPLE_REGEX for correctness.
	]"
	author: "Larry Rix"
	date: "$Date$"

class
	BNF_CONSTANTS

feature -- Access

	Arbitrary_content_rx: STRING = ".*"
	Whitespace_rx: STRING = "\s*"

	Access_control_rx: STRING
		once
			Result := "(?:\{[A-Z][A-Z0-9_]*\})?"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Comment_mark_rx: STRING = "--"
	Comment_text_rx: STRING = "([^\n\r]*)"
	Comment_definition: STRING
		once
			Result := Comment_mark_rx + Comment_text_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Header_mark_pattern_rx: STRING = "(?:deferred|expanded|frozen)?"
	Class_header_pattern_rx: STRING = "class"
	Class_name_rx: STRING = "([A-Z][A-Z0-9_]*)"
	Class_list_rx: STRING
		once
			Result := Class_name_rx + "(?:\s*,\s*" + Class_name_rx + ")*"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Class_definition_rx: STRING
		once
			Result := Header_mark_pattern_rx + Whitespace_rx + Class_header_pattern_rx + Whitespace_rx + Class_name_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Feature_keyword_rx: STRING = "feature"

	Feature_definition_rx: STRING
		once
			Result := Feature_keyword_rx + Whitespace_rx + Access_control_rx + Whitespace_rx + Comment_mark_rx + Comment_text_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Type System

	Type_separator_rx: STRING = ":"
	Attachment_mark_rx: STRING = "(\?|!)"
	Void_safety_prefix_rx: STRING = "(?:(\?|!)?\s*)?"
	Class_type_name_rx: STRING = "[A-Z][a-zA-Z0-9_]*"
	Actual_generics_rx: STRING = "\[[^\]]*\]"
	Formal_generics_rx: STRING = "\[[a-zA-Z0-9_]+(\s*,\s*[a-zA-Z0-9_]+)*\]"
	Like_anchor_rx: STRING = "like\s+[a-zA-Z_][a-zA-Z0-9_]*"

	Type_mark_rx: STRING
		once
			Result := Type_separator_rx + Whitespace_rx + "(?:" + Void_safety_prefix_rx + ")?" + "(?:" + Class_type_name_rx + "(?:" + Actual_generics_rx + ")?" + "|" + Like_anchor_rx + ")"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Feature_type_declaration_rx: STRING
		once
			Result := "[a-zA-Z_][a-zA-Z0-9_]*" + Whitespace_rx + Type_mark_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Feature Declarations

	Feature_name_rx: STRING = "[a-z][a-z0-9_]*"
	Frozen_mark_rx: STRING = "(?:frozen\s+)?"

	Feature_name_with_frozen_rx: STRING
		once
			Result := Frozen_mark_rx + Feature_name_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Multiple_feature_names_rx: STRING
		once
			Result := Feature_name_rx + "(?:\s*,\s*" + Feature_name_rx + ")*"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Feature_signature_rx: STRING
		once
			Result := Multiple_feature_names_rx + Whitespace_rx + Type_mark_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Instructions & Control Flow

	Create_keyword_rx: STRING = "create"
	If_keyword_rx: STRING = "if"
	Then_keyword_rx: STRING = "then"
	Elseif_keyword_rx: STRING = "elseif"
	Else_keyword_rx: STRING = "else"
	End_keyword_rx: STRING = "end"
	From_keyword_rx: STRING = "from"
	Until_keyword_rx: STRING = "until"
	Loop_keyword_rx: STRING = "loop"
	Once_keyword_rx: STRING = "once"
	Retry_keyword_rx: STRING = "retry"
	Check_keyword_rx: STRING = "check"
	Assignment_operator_rx: STRING = ":="
	Variable_name_rx: STRING = "[a-z_][a-zA-Z0-9_]*"

	Create_instruction_rx: STRING
		once
			Result := Create_keyword_rx + Whitespace_rx + Variable_name_rx + "(?:" + Whitespace_rx + "\." + Whitespace_rx + "[a-zA-Z_][a-zA-Z0-9_]*)?(\s+" + "[a-zA-Z_][a-zA-Z0-9_]*(\s*\[[^\]]*\])?)?"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Assignment_instruction_rx: STRING
		once
			Result := Variable_name_rx + Whitespace_rx + Assignment_operator_rx + Whitespace_rx + ".+"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Conditional_block_rx: STRING
		once
			Result := If_keyword_rx + ".*" + Then_keyword_rx + ".*(?:(?:" + Elseif_keyword_rx + "|" + Else_keyword_rx + ").*)*" + End_keyword_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Loop_block_rx: STRING
		once
			Result := From_keyword_rx + ".*" + Until_keyword_rx + ".*" + Loop_keyword_rx + ".*" + End_keyword_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Contract Clauses

	Require_keyword_rx: STRING = "require"
	Require_else_rx: STRING = "require\s+else"
	Ensure_keyword_rx: STRING = "ensure"
	Ensure_then_rx: STRING = "ensure\s+then"
	Invariant_keyword_rx: STRING = "invariant"
	Check_keyword_detail_rx: STRING = "check"

	Precondition_rx: STRING
		once
			Result := "(?:" + Require_keyword_rx + "(?:\s+else)?"  + ")"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Postcondition_rx: STRING
		once
			Result := "(?:" + Ensure_keyword_rx + "(?:\s+then)?"  + ")"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Class_invariant_rx: STRING
		once
			Result := Invariant_keyword_rx
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Expressions

	Old_keyword_rx: STRING = "old"

	Old_expression_rx: STRING
		once
			Result := Old_keyword_rx + Whitespace_rx + "[a-zA-Z_][a-zA-Z0-9_]*"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Current_keyword_rx: STRING = "Current"
	Result_keyword_rx: STRING = "Result"
	Agent_keyword_rx: STRING = "agent"
	Operator_symbols_rx: STRING = "(\+|\-|\*|/|//|\\|&|<|>|=|<=|>=|/=|and|or|not|xor|implies)"

	Expression_rx: STRING
		once
			Result := "[[a-zA-Z0-9_]+\-*().\[\]{}|&<>=]+"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

feature -- Literals

	String_quote_rx: STRING = "%""
	Manifest_string_rx: STRING = "%"[^%"]*%""
	Binary_prefix_rx: STRING = "0[bB]"
	Hex_prefix_rx: STRING = "0[xX]"
	Octal_prefix_rx: STRING = "0[cC]"

	Binary_number_rx: STRING
		once
			Result := Binary_prefix_rx + "[0-1]+"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Hex_number_rx: STRING
		once
			Result := Hex_prefix_rx + "[0-9a-fA-F]+"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Octal_number_rx: STRING
		once
			Result := Octal_prefix_rx + "[0-7]+"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Decimal_number_rx: STRING = "[0-9]+"

	Manifest_integer_rx: STRING
		once
			Result := "(?:" + Binary_number_rx + "|" + Hex_number_rx + "|" + Octal_number_rx + "|" + Decimal_number_rx + ")"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Exponent_notation_rx: STRING = "[eE][+-]?[0-9]+"

	Manifest_real_rx: STRING
		once
			Result := Decimal_number_rx + "\." + Decimal_number_rx + "(?:" + Exponent_notation_rx + ")?"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Boolean_true_rx: STRING = "True"
	Boolean_false_rx: STRING = "False"

	Manifest_boolean_rx: STRING
		once
			Result := "(?:" + Boolean_true_rx + "|" + Boolean_false_rx + ")"
		ensure
			is_valid: regex.is_valid_pattern (Result)
		end

	Void_keyword_rx: STRING = "Void"

feature -- Identifiers

	Identifier_rx: STRING = "[a-zA-Z_][a-zA-Z0-9_]*"

feature {NONE} -- Implementation

	regex: SIMPLE_REGEX
			-- Instance of {SIMPLE_REGEX} for pattern validation.
		once
			create Result
		end

invariant
	class_name_rx_valid: not Class_name_rx.is_empty
	feature_keyword_valid: not Feature_keyword_rx.is_empty

end
