# simple_bnf

[Documentation](https://simple-eiffel.github.io/simple_bnf/) •
[GitHub](https://github.com/simple-eiffel/simple_bnf) •
[Issues](https://github.com/simple-eiffel/simple_bnf/issues)

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Eiffel 25.02](https://img.shields.io/badge/Eiffel-25.02-purple.svg)
![DBC: Contracts](https://img.shields.io/badge/DBC-Contracts-green.svg)
![Windows: tests pass](https://img.shields.io/badge/Windows-tests%20pass-0078D6?logo=windows&logoColor=white) ![Linux: tests pass](https://img.shields.io/badge/Linux-tests%20pass-FCC624?logo=linux&logoColor=black) ![macOS: tests pass](https://img.shields.io/badge/macOS-tests%20pass-000000?logo=apple&logoColor=white)

The grammar of Eiffel, as objects. simple_bnf turns BNF-E — the notation ECMA-367
uses to define the language — into a small object model: every non-terminal
production is a feature you can call, every production knows which of the three
forms it takes and which components it is built from, and a curated set of
regexes finds specimens of a construct in real Eiffel source text.

Part of the [Simple Eiffel](https://github.com/simple-eiffel) ecosystem.

## Status

> **0.1.0 — first public release.** 17 tests, all passing, zero compiler
> warnings. The whole factory is swept by one of those tests, so all 224
> production features are known to build a well-formed `BNF_PRODUCTION`.
>
> Be clear about what this is: a **model of the grammar**, not a parser. It
> classifies and decomposes production rules, and it can tell you whether a
> snippet looks like a specimen of a construct. It does not build a parse tree
> from an Eiffel class, and `BNF_COMPONENT.specimen` — a `SIMPLE_GRAPH` of
> specimens — is a slot nothing fills yet.
>
> Two more honest limits, both recorded in [CHANGELOG.md](CHANGELOG.md):
> the pattern registry covers 31 of the 224 productions, not all of them; and
> `BNF_COMPONENT`'s argumentless `make` can never succeed, because it ensures an
> empty name while the class invariant forbids one. A test pins that defect so a
> repair cannot pass unnoticed.

## Why

ECMA-367 defines Eiffel in about 224 production rules written in BNF-E, and
those rules are the ground truth for every tool that reads Eiffel: linters,
formatters, doc generators, refactoring engines, the `simple_*` code-analysis
work. Copying the grammar into each such tool as ad-hoc string constants is how
they drift apart. simple_bnf holds the grammar once, in one place, with the
standard's own vocabulary — construct, specimen, component, production — and
with contracts that say what a well-formed production is.

## The three production forms

ECMA-367 §8.2.6–8.2.12 gives every non-terminal exactly one production, in one
of three forms. `BNF_PRODUCTION` detects the form from the right side and
decomposes it:

| Form | Right side looks like | What `components` holds |
|------|----------------------|-------------------------|
| **Aggregate** | `Notes Class_header [Formal_generics]` | the fixed sequence, optional parts keeping their brackets |
| **Choice** | `Deferred \| Effective_routine \| Attribute` | one entry per alternative |
| **Repetition** | `{Note_entry ";" ...}*` or `Digit+` | the repeated construct, separator excluded |

## Quick start

```eiffel
local
    factory: ECMA367_PRODUCTIONS
    production: BNF_PRODUCTION
    registry: ECMA367_PRODUCTION_PATTERNS
    regex: SIMPLE_REGEX
do
    create factory
    create registry
    create regex

        -- Ask the standard what a Class_name is made of.
    production := factory.class_name
    print (production.construct_name)      -- Class_name
    print (production.right_side)          -- Identifier
    print (production.is_aggregate)        -- True

        -- Or build a production from its right side and let it classify itself.
    create production.make_from_text ("Feature_body", "Deferred | Effective_routine | Attribute")
    print (production.is_choice)           -- True
    print (production.components.count)    -- 3
    print (production.components [1])      -- Deferred
    print (production.is_valid)            -- True

        -- Find specimens of a construct in real source text.
    if attached registry.get_pattern ("class_name") as al_pattern then
        print (regex.all_matches_for (al_pattern, "class BNF_SPECIMEN") [1])
        -- BNF_SPECIMEN
    end
end
```

## The classes

| Class | Role |
|-------|------|
| `BNF_PRODUCTION` | A production rule: construct name, right side, form, components, validation |
| `BNF_CONSTRUCT` | The abstract syntactic rule a component conforms to (§8.2.2) |
| `BNF_COMPONENT` | A syntactically meaningful piece of class text, with its specimen graph |
| `BNF_SPECIMEN` | One concrete instance of a construct: construct name plus source text |
| `BNF_CONSTANTS` | Curated, self-validating regex constants for Eiffel constructs |
| `ECMA367_PRODUCTIONS` | Factory — one feature per non-terminal, 224 of them |
| `ECMA367_PRODUCTION_NAMES` | The 223 distinct non-terminal names, as an array |
| `ECMA367_PATTERNS` | Hand-curated regexes for the high-value productions |
| `ECMA367_PRODUCTION_PATTERNS` | Registry mapping a production name to its regex, or `Void` |

Why 224 features but 223 names: `Constant_attribute` is generated twice, as
`constant_attribute_prod` (§134) and `constant_attribute_2_prod` (§183). Both
are kept for now so nothing that calls either breaks.

## Installation

1. Set the ecosystem environment variable (one-time setup for all simple_*
   libraries):

```
SIMPLE_EIFFEL=D:\prod
```

2. Add to your ECF:

```xml
<library name="simple_bnf" location="$SIMPLE_EIFFEL/simple_bnf/simple_bnf.ecf"/>
```

## Dependencies

- `base` (ISE)
- `simple_graph` — the specimen graph inside `BNF_COMPONENT`
- `simple_regex` — pattern compilation and matching

The test target adds `simple_testing`, ISE `testing`, and `simple_file` (the
suite reads fixture files). Nothing else — no database, no C libraries.

## Testing

```
/d/prod/ec.sh test -config simple_bnf.ecf -target simple_bnf_tests
./EIFGENs/simple_bnf_tests/F_code/simple_bnf.exe
```

Run the executable **from the library root**: two tests read `src/` and
`testing/test_data/` by a path relative to the current directory. Every file the
suite touches lives inside this repository, so the tests run on any machine that
can build the library.

## Layout

| Path | What |
|------|------|
| `src/` | The nine library classes |
| `testing/` | `TEST_APP` runner, `LIB_TESTS`, the whole-factory sweep, and `test_data/` |
| `docs/` | The documentation site published to GitHub Pages |
| `docs/notes/` | Historical design notes from the February 2026 build — read the caveat there first |
| `simple_bnf.ecf` | Library target and test target |

## License

MIT License - see [LICENSE](LICENSE) file.

---

Part of the [Simple Eiffel](https://github.com/simple-eiffel) ecosystem.
