## `?^` "wutket"

Branch on whether a wing of the subject is a cell.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?^  p
    q
  r
  ```

---

- Wide
- ```hoon
  ?^(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtkt p=wing q=hoon r=hoon]
```

#### Expands to

```hoon
?:(?=(^ p) q r)
```

#### Discussion

The type of the wing, `p`, must not be known to be either an atom or a cell, or
else you'll get a `mint-vain` error at compile time. `mint-vain` means that one
of the `?^` branches, `q` or `r`, is never taken.

#### Examples

```
> ?^(0 1 2)
! mint-vain
! exit

> ?^(`*`0 1 2)
2

> ?^(`*`[1 2] 3 4)
3
```

---

