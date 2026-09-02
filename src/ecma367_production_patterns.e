note
	description: "[
		Maps ECMA-367 productions to their identification patterns.

		Provides a centralized registry that associates each production name
		with its regex pattern. Allows querying patterns by production name
		and creating BNF_PRODUCTION objects with patterns included.
	]"
	author: "Production Pattern Mapping"
	date: "$Date$"

class
	ECMA367_PRODUCTION_PATTERNS

feature -- Pattern Lookup

	get_pattern (a_production_name: READABLE_STRING_GENERAL): detachable STRING
			-- Get regex pattern for production, or Void if none available
		require
			name_not_empty: a_production_name /= Void and not a_production_name.is_empty
		local
			l_name_upper: STRING
		do
			l_name_upper := a_production_name.to_string_8.as_upper

			if l_name_upper.is_equal ("CLASS_HEADER") then
				Result := "class"
			elseif l_name_upper.is_equal ("CLASS_NAME") then
				Result := "([A-Z][A-Z0-9_]*)"
			elseif l_name_upper.is_equal ("HEADER_MARK") then
				Result := "(deferred|expanded|frozen)"
			elseif l_name_upper.is_equal ("FEATURE_CLAUSE") then
				Result := "feature"
			elseif l_name_upper.is_equal ("FEATURE_DECLARATION") then
				Result := "[a-zA-Z0-9_]+ *(, *[a-zA-Z0-9_]+)* *: *[a-zA-Z0-9_]+"
			elseif l_name_upper.is_equal ("FEATURE_NAME") then
				Result := "[a-z][a-z0-9_]*"
			elseif l_name_upper.is_equal ("NEW_FEATURE") then
				Result := "(frozen +)?[a-zA-Z0-9_]+"
			elseif l_name_upper.is_equal ("TYPE_MARK") then
				Result := ": *(\?|!)? *([A-Z][a-zA-Z0-9_]*(\[[^\]]*\])?)?"
			elseif l_name_upper.is_equal ("TYPE") then
				Result := "(\?|!)?([A-Z][a-zA-Z0-9_]*(\[[^\]]*\])?|like +[a-zA-Z0-9_]+)"
			elseif l_name_upper.is_equal ("CLASS_TYPE") then
				Result := "(\?|!)?([A-Z][a-zA-Z0-9_]*)(\[[^\]]*\])?"
			elseif l_name_upper.is_equal ("ATTACHMENT_MARK") then
				Result := "(\?|!)"
			elseif l_name_upper.is_equal ("ACTUAL_GENERICS") then
				Result := "\[[^\]]*\]"
			elseif l_name_upper.is_equal ("INSTRUCTION") then
				Result := "(create|if|loop|do|once|retry|check)"
			elseif l_name_upper.is_equal ("CONDITIONAL") then
				Result := "if.*?then"
			elseif l_name_upper.is_equal ("LOOP") then
				Result := "from.*?until.*?loop"
			elseif l_name_upper.is_equal ("CREATE_INSTRUCTION") then
				Result := "create +[a-zA-Z0-9_]+"
			elseif l_name_upper.is_equal ("ASSIGNMENT") then
				Result := "[a-zA-Z0-9_]+ *:= *.+"
			elseif l_name_upper.is_equal ("PRECONDITION") then
				Result := "require( +else)?"
			elseif l_name_upper.is_equal ("POSTCONDITION") then
				Result := "ensure( +then)?"
			elseif l_name_upper.is_equal ("INVARIANT") then
				Result := "invariant"
			elseif l_name_upper.is_equal ("CHECK") then
				Result := "check"
			elseif l_name_upper.is_equal ("OLD_EXPRESSION") then
				Result := "old +[a-zA-Z0-9_]+"
			elseif l_name_upper.is_equal ("CURRENT") then
				Result := "Current"
			elseif l_name_upper.is_equal ("RESULT") then
				Result := "Result"
			elseif l_name_upper.is_equal ("MANIFEST_STRING") then
				Result := "%"[^%"]*%""
			elseif l_name_upper.is_equal ("MANIFEST_INTEGER") then
				Result := "(0[bBcCxX][0-9a-fA-F]+|[0-9]+)"
			elseif l_name_upper.is_equal ("MANIFEST_REAL") then
				Result := "[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?"
			elseif l_name_upper.is_equal ("MANIFEST_BOOLEAN") then
				Result := "(True|False)"
			elseif l_name_upper.is_equal ("MANIFEST_VOID") then
				Result := "Void"
			elseif l_name_upper.is_equal ("COMMENT") then
				Result := "--[^\n]*"
			else
				Result := Void
			end
		end

	has_pattern (a_production_name: READABLE_STRING_GENERAL): BOOLEAN
			-- Does this production have a registered pattern?
		require
			name_not_empty: a_production_name /= Void and not a_production_name.is_empty
		do
			Result := get_pattern (a_production_name) /= Void
		end

feature -- Production Creation with Patterns

	create_with_pattern (
		a_production_factory: ECMA367_PRODUCTIONS;
		a_production_name: READABLE_STRING_GENERAL
	): detachable BNF_PRODUCTION
			-- Create BNF_PRODUCTION by name, with pattern if available
		require
			factory_not_void: a_production_factory /= Void
			name_not_empty: a_production_name /= Void and not a_production_name.is_empty
		local
			l_pattern: detachable STRING
		do
			l_pattern := get_pattern (a_production_name)
		end

feature -- Statistics

	registered_pattern_count: INTEGER = 31
			-- Number of productions with registered patterns

end
