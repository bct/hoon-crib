## `=?` "tiswut"

Conditionally change one leg in the subject.

#### Syntax

Four arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =?  p  q
    r
  s
  ```

---

- Wide
- ```hoon
  =?(p q r s)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tswt p=wing q=hoon r=hoon s=hoon]
```

#### Expands to

```hoon
=.  p  ?:(q r p)
s
```

#### Discussion

Use `=?` to replace the value of leg `p` with `r` on condition `q`. As
usual, we are not actually mutating the subject, just creating
a new subject with a changed value. The change in value includes a
type check against the old subject; the type of `r` must nest under
the type of `p`.

#### Examples

```
> =a 12

> =?(a =(1 1) 22 a)
22

> =?(a =(1 2) 22 a)
12
```
