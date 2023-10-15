## `++` "luslus"

Produce a normal arm.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ++  p=term  q=hoon
  ```

---

- Wide
- None.

---

- Irregular
- None.
{% /table %}

`p` is the arm name, and `q` is any Hoon expression.

#### Discussion

All arms must have a name (e.g., `add`). An arm is computed by name resolution.
(This resolution is implicit in the case of `$` arms. See `|=`, `|-`, and `|^`.)
The `++` rune is used for explicitly giving a name to an arm.

Any Hoon expression, `q`, may be used to define the arm computation.

#### Examples

```
> =c |%
       ++  two  2
       ++  increment  |=(a=@ +(a))
     --

> two.c
2

> (increment.c 11)
12
```

---

