## `:_` "colcab"

Construct a cell, inverted.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :_  p
  q
  ```

---

- Wide
- ```hoon
  :_(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%clcb p=hoon q=hoon]
```

#### Expands to

```hoon
:-(q p)
```

#### Examples

```
> :_(1 2)
[2 1]
```

---

