## `|^` "barket"

Produce a core whose battery includes a `$` arm and compute the latter.

#### Syntax

One fixed argument, then a variable number of `+`-family expressions.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |^  a=hoon
  ++  b=term  c=hoon
  ++  d=term  e=hoon
       ...
  ++  f=term  g=hoon
  --
  ```

---

- Wide
- None.

---

- Irregular
- None.

---

{% /table %}

#### AST

```hoon
[%brkt p=hoon q=(map term tome)]
```

#### Expands to

```hoon
=>  |%
    ++  $  a=hoon
    ++  b=term  c=hoon
    ++  d=term  e=hoon
           ...
    ++  f=term  g=hoon
    --
$
```

#### Semantics

A `|^` expression produces a multi-arm core whose battery includes a `$` arm,
which is evaluated immediately. `a` is a Hoon expression that defines the
product of the `$` arm. `a` is followed by a series of arm definitions for the
rest of the core battery arms. There must be at least one arm other than the `$`
arm.

#### Discussion

The `|^` rune is useful when you define a multi-arm core in your code and a
particular arm in it is to be evaluated immediately.

#### Examples

A trivial example:

```
> |^
  (add n g)
  ++  n  42
  ++  g  58
  --
100
```

---

