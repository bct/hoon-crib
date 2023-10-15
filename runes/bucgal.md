## `$<` "bucgal"

Filters a pre-existing mold to obtain a mold that excludes a particular
structure.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $<  p
  q
  ```

---

- Wide
- ```hoon
  $<(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bcgl p=spec q=spec]
```

#### Discussion

This can be used to obtain type(s) from a list of types `q` that do not satisfy a
requirement given by `p`.

#### Examples

```
> =foo $%([%bar p=@ud q=@ud] [%baz p=@ud])

> =m $<(%bar foo)

> (m [%bar 2 4])
ford: %ride failed to execute:

> (m [%baz 2])
[%baz p=2]

> ;;($<(%foo [@tas *]) [%foo 1])
ford: %ride failed to execute:

> ;;($<(%foo [@tas *]) [%bar 1])
[%bar 1]
```

---

