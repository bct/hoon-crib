## `^=` "kettis"

Bind name to a value.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^=  p
  q
  ```

---

- Wide
- ```hoon
  ^=(p q)
  ```

---

- Irregular
- ```
    p=q
  ```
{% /table %}

#### AST

```hoon
[%ktts p=skin q=hoon]
```

#### Produces

If `p` is a term, the product `q` with type `[%face p q]`. `p` may also be a
tuple of terms, or a term-skin pair; the type of `q` must divide evenly into
cells to match it.

#### Examples

```
> a=1
a=1

> ^=  a
  1
a=1

> ^=(a 1)
a=1

> [b c d]=[1 2 3 4]
[b=1 c=2 d=[3 4]]

> [b c d=[x y]]=[1 2 3 4]
[b=1 c=2 d=[x=3 y=4]]
```

---

