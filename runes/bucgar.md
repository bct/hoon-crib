## `$>` "bucgar"

Filters a mold to obtain a new mold matching a particular structure.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $>  p
  q
  ```

---

- Wide
- ```hoon
  $>(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bcgr p=spec q=spec]
```

#### Discussion

This can be used to obtain type(s) from a list of types `q` that satisfy a
requirement given by `p`.

#### Examples

Examples with `$%`:

```
> =foo $%([%bar p=@ud q=@ud] [%baz p=@ud])

> =m $>(%bar foo)

> (m [%bar 2 4])
[%bar p=2 q=4]

> (m [%baz 2])
ford: %ride failed to execute:
```

Examples with `;;`:

```
> ;;([@tas *] [%foo 1])
[%foo 1]

> ;;([@tas *] [%bar 1])
[%bar 1]

> ;;($>(%foo [@tas *]) [%foo 1])
[%foo 1]

> ;;($>(%foo [@tas *]) [%bar 1])
ford: %ride failed to execute:
```

---

