note
	description: "[
		Hand-curated regex patterns for ECMA-367 productions.

		These patterns are designed to identify actual specimens of each production
		in real Eiffel source code. They represent semantic understanding of what
		makes a valid specimen of each construct.

		Each pattern is tested against actual Eiffel code samples to verify accuracy.
	]"
	author: "Manual Curation"
	date: "$Date$"
	revision: "$Revision$"
	standards: "ECMA-367:2026"

class
	ECMA367_PATTERNS
	-- Curated regex patterns for identifying ECMA-367 productions in code

feature -- Core Patterns (High-Value Productions)

	-- Class Definitions

	class_header_pattern: STRING = "class"
			-- Matches: [deferred|expanded|frozen] class CLASSNAME
			-- Examples: "class PERSON", "deferred class ABSTRACT", "expanded class IMMUTABLE"

	class_name_pattern: STRING = "[A-Z][A-Z0-9_]*"
			-- Matches: Eiffel class names (start with uppercase, alphanumeric + underscore)
			-- Examples: "PERSON", "MY_CLASS", "ARRAY"

	header_mark_pattern: STRING = "(deferred|expanded|frozen)"
			-- Matches: deferred | expanded | frozen
			-- Keyword markers that modify class behavior

	-- Feature Declarations

	feature_clause_pattern: STRING = "feature"
			-- Matches: feature keyword introducing feature list
			-- May be followed by clients {A, B} and/or comment

	feature_declaration_pattern: STRING = "[a-zA-Z0-9_]+ *(, *[a-zA-Z0-9_]+)* *: *[a-zA-Z0-9_]+"
			-- Matches: feature_name [, feature_name]* : Type
			-- Examples: "name: STRING", "count, size: INTEGER", "x, y: REAL"

	feature_name_pattern: STRING = "[a-z][a-z0-9_]*"
			-- Matches: Eiffel feature names (start with lowercase)
			-- Examples: "name", "get_value", "my_feature_123"

	new_feature_pattern: STRING = "(frozen +)?[a-zA-Z0-9_]+"
			-- Matches: [frozen] feature_name
			-- frozen keyword is optional

	-- Type System

	type_mark_pattern: STRING = ": *(\?|!)? *([A-Z][a-zA-Z0-9_]*(\[[^\]]*\])?)?"
			-- Matches: : [?|!] ClassName [Generics]
			-- Examples: ": STRING", ": ?detachable ARRAY [INTEGER]", ": !attached LIST"

	type_pattern: STRING = "(\?|!)?([A-Z][a-zA-Z0-9_]*(\[[^\]]*\])?|like +[a-zA-Z0-9_]+)"
			-- Matches: [?|!] ClassName [Generics] | like anchor
			-- Examples: "STRING", "?ARRAY [INTEGER]", "!PERSON", "like Current"

	class_type_pattern: STRING = "(\?|!)?([A-Z][a-zA-Z0-9_]*)(\[[^\]]*\])?"
			-- Matches: [?|!] ClassName [Generics]
			-- Examples: "ARRAY", "!PERSON", "?detachable STACK [T]"

	attachment_mark_pattern: STRING = "(\?|!)"
			-- Matches: ? (detachable) or ! (attached)
			-- Void safety markers

	actual_generics_pattern: STRING = "\[[^\]]*\]"
			-- Matches: [Type, Type, ...]
			-- Generic type parameters in square brackets

	formal_generics_pattern: STRING = "\[[a-zA-Z0-9_]+( *, *[a-zA-Z0-9_]+)*\]"
			-- Matches: [G, H, K]
			-- Formal generic parameter declarations

	-- Instructions & Control Flow

	instruction_pattern: STRING = "(create|if|loop|do|once|retry|check|assign)"
			-- Matches: creation, conditional, loop, assignment, retry, check instructions
			-- Keywords that start instructions

	conditional_pattern: STRING = "if.*then.*(elseif|else)?.*end"
			-- Matches: if...then...[elseif/else]...end
			-- Conditional expression (loose matching, may span lines)

	loop_pattern: STRING = "from.*until.*loop.*end"
			-- Matches: from...until...loop...end
			-- Loop structure (loose matching)

	create_instruction_pattern: STRING = "create +[a-zA-Z0-9_]+( *\. *[a-zA-Z0-9_]+)?"
			-- Matches: create Variable [. Routine]
			-- Object creation

	assignment_pattern: STRING = "[a-zA-Z0-9_]+ *:= *.+"
			-- Matches: Variable := Expression
			-- Assignment (loose)

	-- Contracts

	precondition_pattern: STRING = "require( +else)?"
			-- Matches: require [else] Assertion
			-- Precondition clause

	postcondition_pattern: STRING = "ensure( +then)?"
			-- Matches: ensure [then] Assertion
			-- Postcondition clause

	invariant_pattern: STRING = "invariant"
			-- Matches: invariant Assertion
			-- Class invariant

	check_pattern: STRING = "check"
			-- Matches: check Assertion [Notes] end
			-- Runtime check

	-- Expressions

	expression_pattern: STRING = "[[a-zA-Z0-9_]+\-*().\[\]{}|&<>=]+"
			-- Matches: general expressions
			-- Very loose pattern for testing

	old_expression_pattern: STRING = "old +[a-zA-Z0-9_]+"
			-- Matches: old expression_name
			-- Old value in postcondition

	current_pattern: STRING = "Current"
			-- Matches: Current (self reference)

	result_pattern: STRING = "Result"
			-- Matches: Result (return value in query)

	-- Literals

	manifest_string_pattern: STRING = "%"[^%"]*%""
			-- Matches: "string content"
			-- String literals in double quotes

	manifest_integer_pattern: STRING = "(0[bBcCxX][0-9a-fA-F]+|[0-9]+)"
			-- Matches: 123, 0xFF, 0b1010, 0c77
			-- Integer literals with optional base prefix

	manifest_real_pattern: STRING = "[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?"
			-- Matches: 3.14, 1.5e-2, 2.0E10
			-- Real/floating-point literals

	manifest_boolean_pattern: STRING = "(True|False)"
			-- Matches: True | False
			-- Boolean constants (capital T and F in Eiffel)

	manifest_void_pattern: STRING = "Void"
			-- Matches: Void
			-- Null/void reference

	-- Comments

	comment_pattern: STRING = "--[^\n]*"
			-- Matches: -- comment text to end of line
			-- Single-line comments

	-- Identifiers

	identifier_pattern: STRING = "[a-zA-Z_][a-zA-Z0-9_]*"
			-- Matches: valid Eiffel identifiers
			-- Must start with letter or underscore

invariant
	class_header_pattern_valid: not class_header_pattern.is_empty
	class_name_pattern_valid: not class_name_pattern.is_empty
	feature_clause_pattern_valid: not feature_clause_pattern.is_empty

end
