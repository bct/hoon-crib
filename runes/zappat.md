## `!@` "zappat"

Branch on whether a wing exists.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !@  p
    q
  r
  ```

---

- Wide
- ```hoon
  !@(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zppt p=(list wing) q=hoon r=hoon]
```

#### Discussion

`p` is a wing reference like `foo`, `bar.foo`, etc. If `p` exists, `q`. If `p`
does not exist, `r`. Essentially, this is like `?:` for wing existence.

#### Examples

```
> =foo 42

> !@(foo 'exists' 'does not exist')
'exists'

> !@(baz 'exists' 'does not exist')
'does not exist'
```

---

