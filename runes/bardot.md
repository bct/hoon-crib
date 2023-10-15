## `|.` "bardot"

Produce a trap (a core with one arm `$`).

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |.  a
  ```

---

- Wide
- ```hoon
  |.(a)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brdt p=hoon]
```

#### Expands to

```hoon
|%  ++  $  a=hoon
--
```

#### Semantics

A `|.` expression produces a core with a single arm, `$`. The core isn't
explicitly given a sample. `a` is a Hoon expression that defines the computation
of the `$` arm.

The payload of the core is the subject of the `|.` expression.

#### Discussion

A trap is generally used to defer a computation.

#### Examples

A trivial trap:

```
> =foo |.(42)

> $:foo
42

> (foo)
42
```

A more interesting trap:

```
> =foo =/  reps  10
       =/  step  0
       =/  outp  0
       |.
       ?:  =(step reps)
         outp
       $(outp (add outp 2), step +(step))

> (foo)
20
```

Note that we can use `$()` to recurse back into the
trap, since it's a core with an `$` arm.

> `$(...)` expands to `%=($ ...)` (["centis"](/reference/hoon/rune/cen#-centis)).

---

