## `%+` "cenlus"

Call gate with a cell sample.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %+  a
    b
  c
  ```

---

- Wide
- ```hoon
  %+(a b c)
  ```

---

- Irregular
- ```hoon
    (a b c)
  ```
{% /table %}

#### AST

```hoon
[%cnls p=hoon q=hoon r=hoon]
```

#### Semantics

A `%+` expression is for calling a gate with a cell sample. `a` is the gate to
be called, `b` is for the head of the sample, and `c` is for the sample tail.

#### Expands to

```hoon
%-(a=hoon [b=hoon c=hoon])
```

#### Examples

```
> =add-triple |=([a=@ b=@ c=@] :(add a b c))

> %+(add-triple 1 [2 3])
6
```

---

