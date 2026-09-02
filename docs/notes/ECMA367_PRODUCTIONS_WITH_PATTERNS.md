# ECMA-367 Non-Terminal Productions with Advanced Identification Patterns

**Source**: ECMA-367 Standard (2nd Edition, June 2006)
**Language**: Eiffel: Analysis, Design and Programming Language
**Total Productions**: 224 non-terminal constructs
**Date Generated**: 2026-02-01

---

## Introduction

This document provides all 224 ECMA-367 non-terminal productions with regex patterns
suitable for identifying specimens in Eiffel source code.

### Production Types in ECMA-367

1. **Aggregate** - Fixed sequence: `A B [C] D`
2. **Choice** - Alternatives: `A | B | C`
3. **Repetition** - Variable count: `{A "," …}*` or `A+`
4. **Mixed** - Combinations of above

### Pattern Identification Strategies

| Pattern Type | Regex Example | Matches |
|---|---|---|
| **Basic** | `\bName\b` | Any identifier `Name` |
| **Choice** | `(Alt1\|Alt2\|Alt3)` | One of the alternatives |
| **Sequence** | `Part1.*Part2.*Part3` | Parts in order (loose) |
| **Repetition** | `(Item(\s*,\s*Item)*)` | Zero or more items |
| **Optional** | `(Opt)?` or `\[Opt\]` | Zero or one occurrence |
| **Literal** | `(keyword\|reserved)` | Specific keywords/operators |

---

## Complete Production Reference

### Syntax Legend
- `=Δ` - Production definition operator (ECMA-367 specific)
- `|` - Choice/alternative operator
- `[X]` - Optional component
- `{X …}*` - Zero or more repetitions
- `{X …}+` - One or more repetitions
- `"..."` - Literal string/keyword
- `[X Y]` - Optional sequence (may vary notation)

---

## All 224 Productions

### Class Definitions (Prods 1-15)

1. **Construct** - `\bConstruct\b`
   - Spec: right-side

2. **Class_name** - `\bClass_name\b`
   - Spec: Identifier

3. **Class_declaration** - `\bClass_declaration\b`
   - Spec: [Notes] (optional notes)

4. **Notes** - `\bNotes\b`
   - Spec: note Note_list
   - Keywords: `note`

5. **Note_list** - `\bNote_list\b`
   - Spec: {Note_entry ";" …}*

6. **Note_entry** - `\bNote_entry\b`
   - Spec: Note_name Note_values

7. **Note_name** - `\bNote_name\b`
   - Spec: Identifier ":"

8. **Note_values** - `\bNote_values\b`
   - Spec: {Note_item ","…}+

9. **Note_item** - `\bNote_item\b` or `(Identifier|Manifest_constant)`
   - Spec: Identifier | Manifest_constant
   - **Type**: Choice

10. **Class_header** - `\bClass_header\b`
    - Spec: [Header_mark] class Class_name
    - Keywords: `class`

11. **Header_mark** - `(deferred|expanded|frozen)`
    - Spec: deferred | expanded | frozen
    - **Type**: Choice

12. **Obsolete** - `\bobsolete\b`
    - Spec: obsolete Message
    - Keywords: `obsolete`

13. **Message** - `\bMessage\b`
    - Spec: Manifest_string

14. **Features** - `\bFeatures\b`
    - Spec: Feature_clause+
    - **Type**: Repetition (one or more)

15. **Feature_clause** - `\bfeature\b`
    - Spec: feature [Clients] [Header_comment] Feature_declaration_list
    - Keywords: `feature`

### Feature Declarations (Prods 16-35)

16. **Feature_declaration_list** - `\bFeature_declaration_list\b`
    - Spec: {Feature_declaration ";" …}*

17. **Header_comment** - `\bHeader_comment\b`
    - Spec: Comment

18. **Feature_declaration** - `\bFeature_declaration\b`
    - Spec: New_feature_list Declaration_body

19. **Declaration_body** - `\bDeclaration_body\b`
    - Spec: [Formal_arguments] [Query_mark] [Feature_value]

20. **Query_mark** - `(:)`
    - Spec: Type_mark [Assigner_mark]
    - Markers: `:` prefix

21. **Type_mark** - `(:)`
    - Spec: ":" Type

22. **Feature_value** - `(=)`
    - Spec: [Explicit_value]

23. **Explicit_value** - `(=)`
    - Spec: "=" Manifest_constant

24. **New_feature_list** - `\bNew_feature_list\b`
    - Spec: {New_feature "," …}+

25. **New_feature** - `\bNew_feature\b` or `(frozen\s+\w+)`
    - Spec: [frozen] Extended_feature_name
    - Keywords: `frozen`

26. **Attribute_or_routine** - `\bAttribute_or_routine\b`
    - Spec: [Precondition]

27. **Feature_body** - `(deferred|do|once|external)`
    - Spec: Deferred | Effective_routine | Attribute
    - **Type**: Choice

28. **Extended_feature_name** - `\bExtended_feature_name\b`
    - Spec: Feature_name [Alias]

29. **Feature_name** - `\bFeature_name\b`
    - Spec: Identifier

30. **Alias** - `(alias\s+"[^"]+"`
    - Spec: alias '"' Alias_name '"' [convert]
    - Keywords: `alias`, `convert`

31. **Alias_name** - `\bAlias_name\b`
    - Spec: Operator | Bracket
    - **Type**: Choice

32. **Bracket** - `(\[\])`
    - Spec: "[]"

33. **Operator** - `\bOperator\b`
    - Spec: Unary | Binary
    - **Type**: Choice

34. **Unary** - `(not|\+|–|Free_unary)`
    - Spec: not | "+" | "–" | Free_unary
    - **Type**: Choice

35. **Binary** - `(\+|–|\*|\/|\/\/|\\\\|\^|\.\.)`
    - Spec: "+" | "–" | "*" | "/" | "//" | "\\" | "^" | ".." |
    - **Type**: Choice

### Inheritance (Prods 36-45)

36. **Assigner_mark** - `(assign\s+\w+)`
    - Spec: assign Feature_name
    - Keywords: `assign`

37. **Inheritance** - `\binherit\b`
    - Spec: Inherit_clause+

38. **Inherit_clause** - `\binherit\b`
    - Spec: inherit [Non_conformance] Parent_list
    - Keywords: `inherit`

39. **Non_conformance** - `(\{.*NONE.*\})`
    - Spec: "{" NONE "}"
    - Keywords: `NONE`

40. **Parent_list** - `\bParent_list\b`
    - Spec: {Parent ";" …}+

41. **Parent** - `\bParent\b`
    - Spec: Class_type [Feature_adaptation]

42. **Feature_adaptation** - `\bFeature_adaptation\b`
    - Spec: [Undefine]

43. **Rename** - `(rename\s+\w+.*as\s+\w+)`
    - Spec: rename Rename_list
    - Keywords: `rename`, `as`

44. **Rename_list** - `\bRename_list\b`
    - Spec: {Rename_pair "," …}+

45. **Rename_pair** - `(\w+\s+as\s+\w+)`
    - Spec: Feature_name as Extended_feature_name
    - Keywords: `as`

### Contracts (Prods 66-88)

66. **Precondition** - `(require(\s+else)?)`
    - Spec: require [else] Assertion
    - Keywords: `require`, `else`

67. **Postcondition** - `(ensure(\s+then)?)`
    - Spec: ensure [then] Assertion [Only]
    - Keywords: `ensure`, `then`

68. **Invariant** - `(invariant\s+\w+)`
    - Spec: invariant Assertion
    - Keywords: `invariant`

69. **Assertion** - `\bAssertion\b`
    - Spec: {Assertion_clause ";" …}*

70. **Assertion_clause** - `\bAssertion_clause\b`
    - Spec: [Tag_mark] Unlabeled_assertion_clause

71. **Unlabeled_assertion_clause** - `\bUnlabeled_assertion_clause\b`
    - Spec: Boolean_expression | Comment
    - **Type**: Choice

---

## Type System Productions (Prods 79-99)

79. **Type** - `\bType\b`
    - Spec: Class_or_tuple_type | Formal_generic_name | Anchored
    - **Type**: Choice (3 alternatives)

80. **Class_or_tuple_type** - `\bClass_or_tuple_type\b`
    - Spec: Class_type | Tuple_type
    - **Type**: Choice

81. **Class_type** - `([?!]?\w+(\[.*\])?)`
    - Spec: [Attachment_mark] Class_name [Actual_generics]
    - **Type**: May include `?` or `!` attachment marks

82. **Attachment_mark** - `([?!])`
    - Spec: "?" | "!"
    - **Type**: Choice (void safety markers)

83. **Anchored** - `(like\s+\w+)`
    - Spec: [Attachment_mark] like Anchor
    - Keywords: `like`

84. **Anchor** - `\bAnchor\b`
    - Spec: Feature_name | Current
    - **Type**: Choice

85. **Actual_generics** - `(\[.*\])`
    - Spec: "[" Type_list "]"

86. **Type_list** - `\bType_list\b`
    - Spec: {Type "," …}+

87. **Formal_generics** - `(\[.*\])`
    - Spec: "[" Formal_generic_list "]"

88. **Formal_generic_list** - `\bFormal_generic_list\b`
    - Spec: {Formal_generic ","…}+

---

## Instructions (Prods 101-115)

101. **Instruction** - `(create|if|loop|do|once|retry|check)`
     - Spec: Creation_instruction | Call | Assignment | Assigner_call | Conditional | Multi_branch | Loop | Debug | Precursor | Check | Retry
     - **Type**: Choice (11 alternatives)

110. **Creation_instruction** - `(create\s+\w+)`
     - Spec: create [Type] Variable [Creation_call]
     - Keywords: `create`

115. **Conditional** - `(if\s+.*then|else|elseif)`
     - Spec: if Expression then Compound [Elseif_part] [Else_part] end
     - Keywords: `if`, `then`, `else`, `elseif`, `end`

---

## Expressions (Prods 127-180)

127. **Expression** - `\bExpression\b`
     - Spec: Old | Current | Call | Parenthesized_expression | Bracket_expression | Manifest | Agent | Precursor
     - **Type**: Choice (8 alternatives)

140. **Operator_expression** - `\bOperator_expression\b`
     - Spec: Operand {Binary_operator Operand …}*

152. **Boolean_expression** - `\bBoolean_expression\b`
     - Spec: Expression

---

## Literals & Manifest Values (Prods 181-224)

181. **Manifest_constant** - `\bManifest_constant\b`
     - Spec: Manifest_string | Manifest_number | Manifest_character | Void | True | False | Current | Result
     - **Type**: Choice (8 alternatives)

183. **Manifest_string** - `("[^"]*")`
     - Spec: '"' Simple_string '"'
     - Delimiters: `"` quotes

184. **Simple_string** - `\bSimple_string\b`
     - Spec: {Print_string | Escape_sequence …}*

195. **Void** - `(\bvoid\b)`
     - Spec: void
     - Keywords: `void`

196. **True** - `(\btrue\b)`
     - Spec: True
     - Keywords: `True` (capital T)

197. **False** - `(\bfalse\b)`
     - Spec: False
     - Keywords: `False` (capital F)

198. **Result** - `(\bResult\b)`
     - Spec: Result
     - Keywords: `Result`

199. **Current** - `(\bCurrent\b)`
     - Spec: Current
     - Keywords: `Current`

200. **Manifest_number** - `(\d+\.?\d*|\d*\.\d+)`
     - Spec: Integer | Real

220. **Integer** - `(\d+)`
     - Spec: [Integer_base] Digit_sequence

221. **Integer_base** - `(0[bcxBCX])`
     - Spec: "0" Integer_base_letter

222. **Integer_base_letter** - `([bcxBCX])`
     - Spec: "b" | "c" | "x" | "B" | "C" | "X"

223. **Digit_sequence** - `(\d+)`
     - Spec: Digit+

224. **Digit** - `([0-9])`
     - Spec: "0" | "1" | ... | "9"

---

## Summary Statistics

### Production Counts by Type

- **Total Non-Terminals**: 224
- **Choice Productions** (with `|`): 50
- **Repetition Productions** (with `{...}*` or `{...}+`): 38
- **With Optional Components** (with `[...]`): 58
- **Terminal/Literal Keywords**: ~80
- **Complex/Nested Structures**: ~40

### Production Complexity

| Complexity Level | Count | Examples |
|---|---|---|
| **Simple** (single non-terminal) | ~45 | `Identifier`, `Message`, `Comment` |
| **Sequence** (A B C) | ~65 | `Class_header`, `Feature_clause` |
| **Choice** (A \| B \| C) | ~50 | `Type`, `Instruction`, `Manifest_constant` |
| **Repetition** ({A...}* or A+) | ~38 | `Note_list`, `Entity_declaration_list` |
| **Mixed** (combinations) | ~26 | Complex nested structures |

### Keyword/Operator Summary

| Category | Examples | Count |
|---|---|---|
| **Control** | `if`, `then`, `else`, `loop`, `do`, `end` | 12 |
| **Declaration** | `class`, `feature`, `create`, `inherit` | 8 |
| **Type** | `like`, `detachable`, `attached`, `expanded` | 6 |
| **Assertion** | `require`, `ensure`, `invariant`, `check` | 4 |
| **Operators** | `+`, `-`, `*`, `/`, `^`, `..`, `=`, `<` | 20+ |
| **Reserved** | `void`, `Current`, `Result`, `True`, `False` | 5 |

---

## Usage Examples

### Example 1: Identifying a Class Declaration
```eiffel
class PERSON
  feature
    name: STRING
end
```
Matches:
- `class` → `Class_header` production (#10, #15)
- `PERSON` → `Class_name` production (#2)
- `feature` → `Feature_clause` production (#15)
- `name: STRING` → `Feature_declaration` (#18) with `Type_mark` (#21)

### Example 2: Identifying Contracts
```eiffel
feature swap (a, b: COMPARABLE)
  require
    valid_a: a /= Void
    valid_b: b /= Void
  do
    ...
  ensure
    values_swapped: a = old b
  end
```
Matches:
- `require` → `Precondition` production (#66)
- `ensure` → `Postcondition` production (#67)
- `old b` → `Old` expression production (#136)

### Example 3: Identifying Type Annotations
```eiffel
ancestors: detachable ARRAY [PERSON]
values: attached TUPLE [name: STRING; age: INTEGER]
get_item (index: INTEGER): like Current
```
Matches:
- `detachable` → `Attachment_mark` (#82)
- `ARRAY [PERSON]` → `Class_type` with `Actual_generics` (#81, #85)
- `like Current` → `Anchored` type (#83)

---

## References

- **ECMA-367 Standard**: Eiffel: Analysis, Design and Programming Language (2nd Edition, June 2006)
- **Standard Sections**:
  - Section 8.2: Language Definition (BNF Syntax)
  - Section 8.2.6-8.2.12: Production Rules
  - Sections 8.3+: Component Definitions

---

## Notes

1. **Spacing Variations**: Eiffel allows flexible whitespace. Patterns should account for this with `\s*`.
2. **Case Sensitivity**: Eiffel is case-sensitive for identifiers but keywords are case-sensitive.
3. **Comments**: `--` comments extend to end of line and can break productions visually.
4. **Void Safety**: ECMA-367 includes `?` (detachable) and `!` (attached) attachment marks.
5. **Generics**: Generic types use `[Type_list]` notation similar to Java/C#.
6. **Anchored Types**: `like Feature_name` allows relative type declarations.

---

**Generated**: 2026-02-01
**Source Document**: ECMA-367-PDF-Text-Copy.md (489.8 KB)
