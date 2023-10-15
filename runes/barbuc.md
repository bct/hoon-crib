## `|$` "barbuc"

Declares a mold builder wet gate with one or more molds as its sample.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |$  sample
  body
  ```

---

- Wide
- ```hoon
  |$(sample body)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brbc sample=(lest term) body=spec]
```

#### Expands to

```hoon
|$  [a b]
body
```

becomes

```hoon
|*  [a=$~(* $-(* *)) b=$~(* $-(* *))]
^:
body
```

#### Semantics

`|$` is used to declare a wet gate mold builder that is polymorphic in its input
molds. `a` is a `lest` of `term` used as identifiers for the input molds. `b` is
a structure built from elements of `a`. The output of `|$` is a mold builder
obtained by substituting the input molds parameterized by `a` into `b`.

#### Discussion

A mold builder is a wet gate from one or more molds to a mold. A mold is a
function from nouns to nouns with types that may be partial, is always
idempotent, and usually the identity function on the noun itself.

`|$` is a restricted form of `|*`. The use of `|$` over `|*` is one of style, as
either could be used to make wet gates that are mold builders. The buc in `|$`
is a hint that `|$` is closely related to buc runes, and thus `|$` should be
used to make mold builders, while `|*` should be used for any other sort of wet
gate. Unlike `|*`, the body of `|$` is parsed in pattern mode to a `$spec`.
Thus, the second argument of `|$` is frequently a buc rune. For further
discussion of wet gates, see the entry for [`|*`](#-bartar).

Like other single-arm cores, the arm for `|$` is named `$` and this can be used to
define recursive structures. Note however that Hoon is evaluated eagerly, and so
infinite structures are not permitted.

Proper style for `|$` is to enclose the first argument with brackets, even if it
is only a single term. The interpeter will accept a single term without brackets
just fine, but this style is for consistency with the fact that the first
argument is a `lest`.

#### Examples

```
> =foo |$([a b] [b a])

> =bar (foo [@ @tas])

> (bar %cat 3)
[%cat 3]
```

---

