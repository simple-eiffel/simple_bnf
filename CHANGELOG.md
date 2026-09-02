# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-09-02

First public release. The library itself was written in February 2026; this
release brings it under version control, onto the simple_* fleet pattern, and
repairs the three defects that the new tests found.

### Added
- Whole-factory sweep test (`ECMA367_FACTORY_TESTS.test_every_production_instantiates`):
  calls all 224 features of `ECMA367_PRODUCTIONS` and checks each yields a
  production with a construct name, a right side and at least one component.
  This is what caught the two parsing defects below.
- Tests for the object model that was previously untested — `BNF_SPECIMEN`,
  `BNF_COMPONENT`, `BNF_PRODUCTION` in all three forms, both the explicit
  constructors and auto-detection, the production-name array, the factory and
  the pattern registry. The suite went from 3 tests to 17.
- Local test fixture `testing/test_data/manifest_string_sample.txt`.
- `README.md`, `CHANGELOG.md`, `LICENSE`, `package.json`, `.gitignore`, and a
  documentation site under `docs/` published to GitHub Pages.

### Fixed
- **Every choice production raised instead of parsing.**
  `BNF_PRODUCTION.parse_choice_components` split the right side with
  `{SIMPLE_REGEX}.split`, which accepts a `READABLE_STRING_GENERAL` but whose
  gobo backend requires an 8-bit subject; passing `right_side.to_string_32`
  violated `RX_REGULAR_EXPRESSION.split`'s `subject_is_string` precondition. All
  50 choice productions, and `make_choice`, were unusable. It now scans for the
  alternatives with `match_all` instead of splitting.
- **`make_aggregate` failed its own postcondition.** It set `is_choice` and
  `is_repetition` to `False` but never set `is_aggregate` to `True`, so
  `ensure is_aggregate: is_aggregate` and the class invariant `exactly_one_type`
  both failed on every call. `make_choice` and `make_repetition` now state all
  three flags explicitly rather than leaning on default initialization.
- **28 of the 224 factory productions raised a parse postcondition.**
  ECMA-367 writes a repetition's separator as a concrete terminal —
  `{Note_entry ";" ...}*` — not as the schematic section sign
  `parse_repetition_components` looked for, so 27 repetition productions
  extracted no component at all. `Bracket`, whose right side is the
  terminal-only `"[]"`, extracted none either, because
  `parse_aggregate_components` recognized construct names and bracketed
  optionals but not quoted terminals. Both extractors were widened; the
  separator is still excluded from a repetition's components, since it is
  punctuation between specimens rather than a component of them.

### Changed
- `TEST_APP` now uses the fleet's single `run_test (agent …, "name")` helper
  instead of one hand-written wrapper per test.
- `LIB_TESTS.test_manifest_string_rx` read
  `C:\Program Files\Eiffel Software\EiffelStudio 25.02 Standard\…\array.e` and
  asserted a literal count found in that particular file. It could only pass on
  one machine with one EiffelStudio installed at one path. It now reads a
  fixture inside the repository, and checks the reported match position against
  a plain scan of the same text rather than against a magic number.
- The library target no longer requires `simple_sql`, `simple_zstring` or
  `simple_file`. Nothing in `src/` referenced any of them; `simple_sql` was
  linking SQLite into every consumer. `simple_file` moved to the test target,
  which does use it.
- The ECF carries a `<description>`.
- The February 2026 markdown under `docs/` moved to `docs/notes/`, so the
  published site root holds the site. See `docs/notes/README.md` for what in
  those documents is real and what was never built.

### Known limitations
- **`BNF_COMPONENT.make` cannot succeed.** It ensures `name.is_empty` while the
  class invariant demands `not name.is_empty`; the two contracts contradict each
  other, so `create c.make` always raises with assertions on.
  `make_from_construct` is unusable for the same reason — `BNF_CONSTRUCT` has no
  create clause and no setter, so a construct's name is always empty. Repairing
  this means deciding whether a nameless component is legal, which is a design
  call rather than a bug fix, so the defect is left standing and pinned by
  `LIB_TESTS.test_component_argumentless_make_is_a_known_defect`: the day the
  contradiction is repaired, that test fails and says so.
- `ECMA367_PRODUCTION_PATTERNS` registers regexes for 31 productions. The other
  193 return `Void`.
- `BNF_COMPONENT.specimen` is a `SIMPLE_GRAPH [BNF_SPECIMEN]` that nothing in the
  library populates.
- `ECMA367_PRODUCTIONS` has 224 features for 223 distinct non-terminals:
  `Constant_attribute` appears twice, as `constant_attribute_prod` and
  `constant_attribute_2_prod`.

[0.1.0]: https://github.com/simple-eiffel/simple_bnf/releases/tag/v0.1.0
