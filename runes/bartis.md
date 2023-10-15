## `|=` "bartis"

Produce a gate (a one-armed core with a sample).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |=  a
  b
  ```

---

- Wide
- ```hoon
  |=(a b)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brts p=spec q=hoon]
```

#### Expands to

```hoon
=+  ^~(*a=spec)
|%  ++  $  b=hoon
--
```

#### Definition

The product of a `|=` expression is a dry **gate**, i.e., a Hoon function.

`p` defines the gate sample type -- i.e., the input value type -- and usually
includes a sample name assignment (e.g., `a=@`). `q` is an expression that
determines the output value of the gate.

#### Discussion

Dry gates are used for the vast majority of ordinary functions in Hoon.

A gate is a core with one arm named `$`, so we can recurse back into it with `$()`.

> `$(...)` expands to `%=($ ...)` (["centis"](/reference/hoon/rune/cen#-centis)).

#### Examples

A trivial gate:

```
> =foo |=(a=@ +(a))

> (foo 20)
21
```

A slightly less trivial gate:

```
> =foo |=  [a=@ b=@]
       (add a b)

> (foo 30 400)
430
```

---

