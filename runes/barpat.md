## `|@` "barpat"

Produce a 'wet' core `[battery payload]`.

#### Syntax

Arguments: a variable number of `+`-family expressions.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |@
  ++  a=term  b=hoon
  ++  c=term  d=hoon
       ...
  ++  e=term  f=hoon
  --
  ```

---

- Wide
- None.

---

- Irregular
- None.
{% /table %}

Note: The `++` rune may be replaced with any other rune in the `+` family.

#### AST

```hoon
[%brpt p=(unit term) q=(map term tome)]
```

#### Semantics

A `|@` expression produces a 'wet' core whose payload is the expression's
subject. The various arms in the battery are each named (`a`, `c`, and `e`
above) and defined explicitly with a Hoon expression (with `b`, `d`, and `f`
above).

#### Discussion

The `|@` rune is just like the `|%` rune except that instead of producing a
'dry' core, it produces a 'wet' one. This allows for type polymorphism of its
arms, using 'genericity'. See [Advanced types](/reference/hoon/advanced).

---

