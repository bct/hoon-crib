## `|%` "barcen"

Produce a core, `[battery payload]`.

#### Syntax

Argument: a variable number of `+`-family expressions.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |%
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
[%brcn p=(unit term) q=(map term tome)]
```

#### Semantics

The product of a `|%` expression is a dry core with one or more arms in the
battery.

The `|%` rune is followed by a series of arm definitions, each of which begins
with a rune in the `+` family (most of `++`). There must be at least one arm,
but there may be arbitrarily many. Each arm must include a name (`a`, `c`, and
`e` above), which is followed by the expression (`b`, `d`, and `f` above) that
defines the arm product.

The core payload is the subject of the `|%` expression.

#### Discussion

A core is a cell of `[battery payload]`, where the `battery` is code and the
`payload` is data. The `battery` is one or more arms. An arm is a computation
that takes the core itself as its subject.

The `|%` rune is used to construct a core from a series of arm definitions. Each
arm definition in the expression begins with an arm rune (`++`, `+$`, or `+*`).
These arms make up the `battery`. The subject of the `|%` expression is used to
make the core's `payload`.

A core is like an "object" in a conventional language, but its attributes
(_arms_) are functions on the core, not the core and an argument. A "method" on
a core is an arm that produces a gate.

#### Examples

A trivial core:

```
> =foo =+  x=58
       |%
       ++  n  (add 42 x)
       ++  g  |=  b=@
              (add b n)
       --

> n.foo
100

> (g.foo 1)
101
```

---

