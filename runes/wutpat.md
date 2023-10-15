## `?@` "wutpat"

Branch on whether a wing of the subject is an atom.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?@  p
    q
  r
  ```

---

- Wide
- ```hoon
  ?@(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtpt p=wing q=hoon r=hoon]
```

#### Expands to

```hoon
?:(?=(@ p) q r)
```

#### Produces

If `p` is an atom, `q`. If `p` is a cell, `r`.

#### Discussion

The type of the wing, `p`, must not be known to be either an atom or a cell, or
else you'll get a `mint-vain` error at compile time. `mint-vain` means that one
of the `?@` branches, `q` or `r`, is never taken.

#### Examples

```
> ?@(0 1 2)
! mint-vain
! exit

> ?@(`*`0 1 2)
1

> ?@(`*`[1 2] 3 4)
4
```

---

