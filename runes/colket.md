## `:^` "colket"

Construct a quadruple (4-tuple).

#### Syntax

Four arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :^    p
      q
    r
  s
  ```

---

- Wide
- ```hoon
  :^(p q r s)
  ```

---

- Irregular
- ```hoon
    [p q r s]
  ```
{% /table %}

#### AST

```hoon
[%clkt p=hoon q=hoon r=hoon s=hoon]
```

#### Expands to

```hoon
:-(p :-(q :-(r s)))
```

#### Examples

```
> :^(1 2 3 4)
[1 2 3 4]

> :^    5
      6
    7
  8
[5 6 7 8]
```

---

