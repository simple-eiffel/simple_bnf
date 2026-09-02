# Specimen Matching Guide

## Overview

The specimen matching system identifies instances of ECMA-367 productions in actual Eiffel source code using regex patterns and the SIMPLE_REGEX library.

## Architecture

### Three Core Classes

#### 1. **ECMA367_PRODUCTION_PATTERNS**
Centralized registry of production-to-pattern mappings.

**Current Coverage**: 31 high-value productions with patterns
- Class definitions (class_header, class_name, header_mark)
- Feature declarations (feature_clause, feature_declaration, feature_name)
- Type system (type_mark, type, class_type, attachment_mark)
- Instructions (instruction, conditional, loop, create, assignment)
- Contracts (precondition, postcondition, invariant, check)
- Expressions (old_expression, current, result)
- Literals (string, integer, real, boolean, void)
- Comments

**Methods:**
```eiffel
get_pattern(production_name: STRING): STRING
  -- Returns regex pattern for production (or Void if none)

has_pattern(production_name: STRING): BOOLEAN
  -- Check if pattern is registered

registered_pattern_count: INTEGER = 31
  -- Number of productions with patterns
```

#### 2. **BNF_PRODUCTION** (Enhanced)
Now includes compiled regex objects for pattern matching.

**New Features:**
```eiffel
pattern_regex: detachable SIMPLE_REGEX
  -- Compiled regex for this production

make_with_pattern(name, spec, pattern: STRING)
  -- Create production with compiled regex pattern
  -- Automatically compiles pattern string to SIMPLE_REGEX
```

**Usage Example:**
```eiffel
local
  prod: BNF_PRODUCTION
do
  create prod.make_with_pattern(
    "Class_header",
    "[Header_mark] class Class_name",
    "(deferred|expanded|frozen)?\s+class\s+\w+"
  )
  -- Now prod.pattern_regex can match code
end
```

#### 3. **SPECIMEN_MATCHER**
Identifies specimens of productions in code using patterns.

**Key Methods:**

```eiffel
-- Test if code matches production
matches_production(code: STRING; production: BNF_PRODUCTION): BOOLEAN
  -- Uses production.pattern_regex

is_specimen_of(code: STRING; production_name: STRING): BOOLEAN
  -- Matches code against named production's pattern

-- Extract matched specimens
extract_specimens(code: STRING; production: BNF_PRODUCTION): LIST[STRING]
  -- Return all matched parts of code

extract_specimens_by_name(code: STRING; name: STRING): LIST[STRING]
  -- Extract by production name

-- Find matches
find_production_matches(code: STRING; factory: ECMA367_PRODUCTIONS): LIST[STRING]
  -- Find all productions matching code

-- Statistics
count_specimens(code: STRING; production_name: STRING): INTEGER
  -- Count occurrences in code
```

## Usage Examples

### Example 1: Test if code matches a production

```eiffel
local
  matcher: SPECIMEN_MATCHER
  code: STRING
do
  create matcher
  code := "class PERSON"

  if matcher.is_specimen_of(code, "CLASS_HEADER") then
    print("Valid class header found!")
  end
end
```

### Example 2: Extract all matching specimens

```eiffel
local
  matcher: SPECIMEN_MATCHER
  code: STRING
  specimens: LIST[STRING]
do
  create matcher
  code := "name: STRING; count: INTEGER; total: INTEGER"

  specimens := matcher.extract_specimens_by_name(code, "FEATURE_DECLARATION")
  -- specimens contains: ["name: STRING", "count: INTEGER", "total: INTEGER"]

  across specimens as spec loop
    print("Found: " + spec.item + "%N")
  end
end
```

### Example 3: Find all productions matching code

```eiffel
local
  matcher: SPECIMEN_MATCHER
  productions: LIST[STRING]
do
  create matcher
  productions := matcher.find_production_matches("Void", factory)
  -- Returns: ["MANIFEST_VOID"]

  productions := matcher.find_production_matches("Current", factory)
  -- Returns: ["CURRENT"]

  productions := matcher.find_production_matches("-- comment", factory)
  -- Returns: ["COMMENT"]
end
```

### Example 4: Validate entire code fragment

```eiffel
local
  matcher: SPECIMEN_MATCHER
  eiffel_code: STRING
do
  create matcher
  eiffel_code := "[
    class PERSON
      feature
        name: STRING
        age: INTEGER
    end
  ]"

  -- Count different productions in code
  print("Classes: " + matcher.count_specimens(eiffel_code, "CLASS_HEADER").out + "%N")
  print("Features: " + matcher.count_specimens(eiffel_code, "FEATURE_DECLARATION").out + "%N")
  print("Types: " + matcher.count_specimens(eiffel_code, "TYPE").out + "%N")
end
```

## Currently Registered Patterns (31)

### Class Definitions (7)
- `CLASS_HEADER`: `(deferred|expanded|frozen)?\s+class\s+\w+`
- `CLASS_NAME`: `\b([A-Z][A-Z0-9_]*)\b`
- `HEADER_MARK`: `\b(deferred|expanded|frozen)\b`
- `FEATURE_CLAUSE`: `\bfeature\b`
- `FEATURE_DECLARATION`: `\w+\s*(,\s*\w+)*\s*:\s*\w+`
- `FEATURE_NAME`: `\b[a-z][a-z0-9_]*\b`
- `NEW_FEATURE`: `(frozen\s+)?\w+`

### Type System (5)
- `TYPE_MARK`: `:\s*(\?|!)?\s*([A-Z]\w*(\[[^\]]*\])?)?`
- `TYPE`: `(\?|!)?([A-Z]\w*(\[[^\]]*\])?|like\s+\w+)`
- `CLASS_TYPE`: `(\?|!)?([A-Z]\w*)(\[[^\]]*\])?`
- `ATTACHMENT_MARK`: `(\?|!)`
- `ACTUAL_GENERICS`: `\[[^\]]*\]`

### Instructions (6)
- `INSTRUCTION`: `\b(create|if|loop|do|once|retry|check)\b`
- `CONDITIONAL`: `\bif\b.*\bthen\b`
- `LOOP`: `\bfrom\b.*\buntil\b.*\bloop\b`
- `CREATE_INSTRUCTION`: `\bcreate\b\s+\w+`
- `ASSIGNMENT`: `\w+\s*:=\s*.+`
- (+ 1 more)

### Contracts (4)
- `PRECONDITION`: `\brequire\b(\s+else)?`
- `POSTCONDITION`: `\bensure\b(\s+then)?`
- `INVARIANT`: `\binvariant\b`
- `CHECK`: `\bcheck\b`

### Expressions (3)
- `OLD_EXPRESSION`: `\bold\s+\w+`
- `CURRENT`: `\bCurrent\b`
- `RESULT`: `\bResult\b`

### Literals (5)
- `MANIFEST_STRING`: `"[^"]*"`
- `MANIFEST_INTEGER`: `\b(0[bBcCxX][0-9a-fA-F]+|[0-9]+)\b`
- `MANIFEST_REAL`: `\b[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?\b`
- `MANIFEST_BOOLEAN`: `\b(True|False)\b`
- `MANIFEST_VOID`: `\bVoid\b`

### Other (1)
- `COMMENT`: `--[^\n]*`

## Extending with New Patterns

To add patterns for more productions:

1. **Update ECMA367_PRODUCTION_PATTERNS:**
```eiffel
when "MY_PRODUCTION" then
  Result := "my_regex_pattern_here"
```

2. **Increment registered_pattern_count:**
```eiffel
registered_pattern_count: INTEGER = 32  -- was 31
```

3. **Add to SPECIMEN_MATCHER.find_production_matches:**
```eiffel
production_names := <<
  "CLASS_HEADER", "CLASS_NAME", ..., "MY_PRODUCTION"
>>
```

## Test Coverage

**SPECIMEN_MATCHER_TESTS** validates:
- ✅ Class header matching
- ✅ Feature declaration matching
- ✅ Type matching
- ✅ Assignment matching
- ✅ Create instruction matching
- ✅ Comment matching
- ✅ Contract keyword matching
- ✅ Old expressions
- ✅ Current reference
- ✅ Void keyword
- ✅ Specimen extraction
- ✅ Finding production matches
- ✅ Counting specimens

## Performance Notes

- **Compilation**: Patterns are compiled once at production creation
- **Matching**: O(n) where n is code length (linear scan with compiled regex)
- **Extraction**: All matches extracted in single pass using `match_all`
- **Memory**: SIMPLE_REGEX objects cached in BNF_PRODUCTION instances

## Future Work

1. **Expand patterns** - Currently 31/224 productions; extend to ~100 high-value ones
2. **Optimize matching** - Build production index for faster lookups
3. **Semantic validation** - Verify extracted specimens match broader syntax rules
4. **Refactoring detector** - Find patterns that match multiple productions
5. **Code transformation** - Use matches to guide automated transformations
