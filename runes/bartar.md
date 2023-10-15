## `|*` "bartar"

Produce a wet gate (one-armed core with sample).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |*  a  b
  ```

---

- Wide
- ```hoon
  |*(a b)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brtr p=spec q=hoon]
```

#### Expands to

```hoon
=|  a
|@
++  $
  b
--
```

#### Semantics

A `|*` expression produces a wet gate. `a` defines the gate's sample, and `b` is
a Hoon expression that determines the output value of the gate.

#### Discussion

In a normal (dry) gate, your argument is converted into the
sample type. In a generic (wet) gate, your argument type
passes through the function, rather as if it were a macro (there
is still only one copy of the code, however).

Genericity is a powerful and dangerous tool. Use wet gates only if
you know what you're doing.

Just as with a [gate](#-bartis), we can recurse back into a wet gate
with `$()`.

> `$(...)` expands to `%=($ ...)` (["centis"](/reference/hoon/rune/cen#-centis)).

`|*` can be used to make wet gates that produce structures, but this usage is
discouraged in favor of `|$`.

#### Examples

Wet and dry gates in a nutshell:

```
> =foo |=([a=* b=*] [b a])

> =bar |*([a=* b=*] [b a])

> (foo %cat %dog)
[6.778.724 7.627.107]

> (bar %cat %dog)
[%dog %cat]
```

The dry gate does not preserve the type of `a` and `b`; the wet
gate does.

---

