## `|_` "barcab"

Produce a **door** (a core with a sample).

#### Syntax

One fixed argument, then a variable number of `+`-family expressions.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |_  a=spec
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
{% /table %}

Note: The `++` rune may be replaced with any other rune in the `+` family.

#### AST

```hoon
[%brcb p=spec q=alas r=(map term tome)]
```

#### Expands to

```hoon
=|  a=spec
|%
++  b=term  c=hoon
++  d=term  e=hoon
       ...
++  f=term  g=hoon
--
```

#### Semantics

The product of a `|_` expression is a **door**, a core with one or more arms
whose payload includes a sample. That is, a door is a cell of `[battery [sample context]]`, where the `battery` contains one or more arms.

`a` defines the door sample type and usually includes a name assignment (e.g.,
`n=@`). `a` is followed by a series of arm definitions, each of which begins
with a rune in the `+` family (most of `++`). There must be at least one arm,
but there may be arbitrarily many. Each arm must include a name (`b`, `d`, and
`f` above), which is followed by the expression (`c`, `e`, and `g` above) that
defines the arm product.

The context of the door is the subject of the `|_` expression.

#### Discussion

A door is the general case of a gate (function). A gate is a door with only one
arm, which has the name `$`.

Calling a door is like calling a gate except the caller also needs to specify
the arm to be computed. So, for example, if you have some door `door` which
contains some arm `arm`, and you want to pass some argument (i.e., input value
`arg`), you would call it with `~(arm door arg)`.

Because gates are also doors, you can call them the same way. To call the gate
`foo` as a door, instead of `(foo baz)` we would write `~($ foo baz)`. This is
an irregular form for `%~($ foo baz)`,
[%~](/reference/hoon/rune/cen#-censig).

#### Examples

A trivial door:

```
> =mol |_  a=@ud
       ++  succ  +(a)
       ++  prev  (dec a)
       --

> ~(succ mol 1)
2

> ~(succ mol ~(succ mol ~(prev mol 5)))
6
```

A more interesting door, from the kernel library:

```hoon
++  ne
  |_  tig=@
  ++  d  (add tig '0')
  ++  x  ?:((gte tig 10) (add tig 87) d)
  ++  v  ?:((gte tig 10) (add tig 87) d)
  ++  w  ?:(=(tig 63) '~' ?:(=(tig 62) '-' ?:((gte tig 36) (add tig 29) x)))
  --
```

The `ne` door prints a digit in base 10, 16, 32 or 64:

```
~zod:dojo> `@t`~(x ne 12)
'c'
```

---

