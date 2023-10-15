## `:-` "colhep"

Construct a cell (2-tuple).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :-  p
  q
  ```

---

- Wide
- ```hoon
  :-(p q)
  ```

---

- Irregular #1
- ```hoon
  [p q]
  ```

---

- Irregular #2
- ```
    p^q
  ```
{% /table %}

#### AST

```hoon
[%clhp p=hoon q=hoon]
```

#### Produces

The cell of `p` and `q`.

#### Discussion

Hoon expressions actually use the same "autocons" pattern as Nock
formulas. If you're assembling expressions (which usually only the
compiler does), `[a b]` is the same as `:-(a b)`.

#### Examples

```
> :-(1 2)
[1 2]

~zod:dojo> 1^2
[1 2]
```

---

