## `|-` "barhep"

Produce a trap (a core with one arm `$`) and evaluate it.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |-  a
  ```

---

- Wide
- ```hoon
  |-(a)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brhp p=hoon]
```

#### Expands to

```hoon
=<($ |.(a=hoon))
```

#### Semantics

A `|-` expression produces a core with one arm named `$` and immediately
evaluates `$`. `a` is a Hoon expression that determines what `$` evaluates to.

#### Discussion

The `|-` rune can be thought of as a 'recursion point' or a 'loop starting
point'. Since `|-` makes a `|.` (["bardot"](#-bardot), a core with one arm named
`$`, we can recurse back into it with `$()`.

> `$(...)` expands to `%=($ ...)` (["centis"](/reference/hoon/rune/cen#-centis)).

#### Examples

A trivial computation doesn't recurse:

```
> |-(42)
42
```

The classic loop is a decrement:

```
> =foo =/  a  42
       =/  b  0
       |-
       ?:  =(a +(b))
         b
       $(b +(b))

> foo
41
```

---

