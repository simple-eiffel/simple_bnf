# Design notes, February 2026

These are the working documents from the original build of simple_bnf. They are
kept because the production listings are genuinely useful reference material —
and because deleting the record of what was planned would hide the difference
between what was planned and what exists.

**Read them with this caveat.** Several of them describe a `SPECIMEN_MATCHER`
class, and `ECMA367_PRODUCTION_NAMES` names a `PRODUCTION_COLLECTOR`. Neither
class is in this repository; neither was ever written. Where a document says
"Complete", "✅", or quotes a test count, it is describing an intention from
February 2026, not the state of the code. The code's state is in the top-level
[README](../../README.md) and [CHANGELOG](../../CHANGELOG.md), and it is what the
test suite actually proves.

| File | What it is | Trust it? |
|------|-----------|-----------|
| `ECMA367_PRODUCTIONS_LIST.md` | The ECMA-367 non-terminals with their right sides | Yes — reference material |
| `ECMA367_PRODUCTIONS_WITH_PATTERNS.md` | Productions annotated with candidate regexes | Mostly — a superset of what `ECMA367_PRODUCTION_PATTERNS` actually registers |
| `ecma367_productions.txt` | The same list in plain text, as extracted from the standard | Yes — reference material |
| `IMPLEMENTATION_SUMMARY.md` | Phase-by-phase build report | No — describes `SPECIMEN_MATCHER` and test counts that do not exist |
| `QUICK_REFERENCE.md` | A 30-second API tour | No — the entire API it shows is `SPECIMEN_MATCHER` |
| `SPECIMEN_MATCHING_GUIDE.md` | How specimen matching was meant to work | No — a design document for unbuilt code |

The two unbuilt classes are a reasonable description of where this library would
go next: `SPECIMEN_MATCHER` to ask "is this text a specimen of that construct?"
and to extract all specimens of a production from a file, and
`PRODUCTION_COLLECTOR` to walk the whole production vocabulary across a class.
Nothing in the current library blocks either.
