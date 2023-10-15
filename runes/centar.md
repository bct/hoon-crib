## `%*` "centar"

Evaluate an expression, then resolve a wing with changes.

#### Syntax

Two fixed arguments, then a variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall style #1
- ```hoon
  %*  a=wing  b=hoon
    c=wing  d=hoon
    e=wing  f=hoon
         ...
    g=wing  h=hoon
  ==
  ```

---

- Tall style #2
- ```hoon
  %*    a=wing  b=hoon
      c=wing
    d=hoon
  ::
      e=wing
    f=hoon
  ::
      g=wing
    h=hoon
  ==
  ```

---

- Wide
- ```hoon
  %*(a b c d, e f, g h)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%cntr p=wing q=hoon r=(list (pair wing hoon))]
```

#### Semantics

A `%*` expression evaluates some arbitrary Hoon expression, `b`, and then
resolves a wing of that result, with changes. `a` is the wing to be resolved,
and one or more changes is defined by the subexpressions after `b`.

#### Expands to

```hoon
=+  b=hoon
%=  a=wing
  c=wing  d=hoon
  e=wing  f=hoon
       ...
  g=wing  h=hoon
==
```

#### Examples

```
> %*($ add a 2, b 3)
5

> %*(b [a=[12 14] b=[c=12 d=44]] c 11)
[c=11 d=44]

> %*(b [a=[12 14] b=[c=12 d=44]] c 11, d 33)
[c=11 d=33]

> =foo [a=1 b=2 c=3 d=4]

> %*(+ foo c %hello, d %world)
[b=2 c=%hello d=%world]

> =+(foo=[a=1 b=2 c=3] foo(b 7, c 10))
[a=1 b=7 c=10]

> %*(foo [foo=[a=1 b=2 c=3]] b 7, c 10)
[a=1 b=7 c=10]
```

---

