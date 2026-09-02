# Quick Reference: Simple BNF Specimen Matching

## In 30 Seconds

```eiffel
local
  matcher: SPECIMEN_MATCHER
  factory: ECMA367_PRODUCTIONS
do
  create matcher
  create factory

  -- Is "class PERSON" a valid class header?
  if matcher.is_specimen_of("class PERSON", "CLASS_HEADER") then
    print("Yes, valid!")
  end

  -- Find all types in code
  types := matcher.extract_specimens_by_name(code, "TYPE")

  -- What productions match "Void"?
  prods := matcher.find_production_matches("Void", factory)
end
```

## Three Classes You Need

| Class | Purpose | Key Method |
|-------|---------|-----------|
| **SPECIMEN_MATCHER** | Find productions in code | `is_specimen_of(code, name)` |
| **ECMA367_PRODUCTIONS** | Access all 224 productions | `factory.class_header` |
| **ECMA367_PRODUCTION_PATTERNS** | Pattern registry | `get_pattern(name)` |

## Common Tasks

### Check if code matches a production
```eiffel
if matcher.is_specimen_of("name: STRING", "FEATURE_DECLARATION") then
  print("Valid feature declaration")
end
```

### Extract all matching specimens
```eiffel
list := matcher.extract_specimens_by_name(code, "COMMENT")
-- Returns all comments from code
```

### Count occurrences of a production
```eiffel
n := matcher.count_specimens(code, "TYPE")
print("Found " + n.out + " types")
```

### Find what productions match code
```eiffel
matches := matcher.find_production_matches("True", factory)
-- Returns: ["MANIFEST_BOOLEAN"]
```

### Get production by name from factory
```eiffel
prod := factory.class_header      -- Production 10
prod := factory.feature_clause    -- Production 15
prod := factory.type_prod         -- Production 82
```

## All 31 Available Productions

```
CLASS_HEADER          - class declarations
CLASS_NAME            - class names
HEADER_MARK           - deferred|expanded|frozen
FEATURE_CLAUSE        - feature keyword
FEATURE_DECLARATION   - name: Type declarations
FEATURE_NAME          - feature identifiers
NEW_FEATURE           - [frozen] name
TYPE_MARK             - : Type
TYPE                  - any type
CLASS_TYPE            - ClassName [Generics]
ATTACHMENT_MARK       - ? or !
ACTUAL_GENERICS       - [Type, Type]
INSTRUCTION           - instructions
CONDITIONAL           - if...then
LOOP                  - from...until...loop
CREATE_INSTRUCTION    - create obj
ASSIGNMENT            - x := y
PRECONDITION          - require
POSTCONDITION         - ensure
INVARIANT             - invariant
CHECK                 - check
OLD_EXPRESSION        - old value
CURRENT               - Current
RESULT                - Result
MANIFEST_STRING       - "string"
MANIFEST_INTEGER      - 42, 0xFF, 0b1010
MANIFEST_REAL         - 3.14
MANIFEST_BOOLEAN      - True, False
MANIFEST_VOID         - Void
COMMENT               - -- comment
```

## Pattern Examples

```
CLASS_HEADER:        (deferred|expanded|frozen)?\s+class\s+\w+
FEATURE_DECL:        \w+\s*(,\s*\w+)*\s*:\s*\w+
TYPE:                (\?|!)?([A-Z]\w*(\[[^\]]*\])?|like\s+\w+)
ASSIGNMENT:          \w+\s*:=\s*.+
COMMENT:             --[^\n]*
```

## Common Patterns

```eiffel
-- Match multiple productions
prods := <<
  "CLASS_HEADER", "FEATURE_DECLARATION", "TYPE", "COMMENT"
>>

-- Process all matches
across prods as p loop
  if matcher.is_specimen_of(code, p.item) then
    print("Found: " + p.item + "%N")
  end
end

-- Analyze production usage
stats: HASH_TABLE [INTEGER, STRING]
create stats.make (10)
stats.put (matcher.count_specimens(code, "CONDITIONAL"), "if statements")
stats.put (matcher.count_specimens(code, "LOOP"), "loops")
stats.put (matcher.count_specimens(code, "PRECONDITION"), "preconditions")
```

## Error Handling

```eiffel
local
  matcher: SPECIMEN_MATCHER
  result: BOOLEAN
do
  create matcher

  -- Safe: returns false if pattern not found
  result := matcher.is_specimen_of(code, "UNKNOWN_PRODUCTION")
  if not result then
    print("Production not recognized")
  end

  -- Safe: returns empty list if no matches
  if matcher.extract_specimens_by_name(code, "TYPE").is_empty then
    print("No types found")
  end
end
```

## Performance Notes

- **Matching**: O(n) where n = code length
- **Extraction**: Single pass, all matches found together
- **Lookup**: O(1) hash table access
- **Pattern compilation**: Done at production creation (cached)

## Extending with New Productions

1. Add pattern to `ECMA367_PRODUCTION_PATTERNS`:
   ```eiffel
   when "MY_PRODUCTION" then
     Result := "my_regex_pattern"
   ```

2. Update count in `registered_pattern_count`

3. Add to production list in `SPECIMEN_MATCHER.find_production_matches`

## Testing a Production

```eiffel
local
  matcher: SPECIMEN_MATCHER
  code: STRING
  specimens: LIST [STRING]
do
  create matcher

  -- Test code
  code := "class EXAMPLE
    feature
      name: STRING
      age: INTEGER
    end"

  -- Validate components
  assert(matcher.is_specimen_of("class EXAMPLE", "CLASS_HEADER"))
  assert(matcher.is_specimen_of("name: STRING", "FEATURE_DECLARATION"))

  -- Count productions
  print("Classes: " + matcher.count_specimens(code, "CLASS_HEADER").out + "%N")
  print("Features: " + matcher.count_specimens(code, "FEATURE_DECLARATION").out + "%N")
end
```

## See Also

- **SPECIMEN_MATCHING_GUIDE.md** - Full usage guide with examples
- **ECMA367_PRODUCTIONS_WITH_PATTERNS.md** - Detailed pattern reference
- **IMPLEMENTATION_SUMMARY.md** - Architecture and design overview
