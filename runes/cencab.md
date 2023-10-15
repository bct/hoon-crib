## `%_` "cencab"

Resolve a wing with changes, preserving type.

#### Syntax

One fixed argument, then a variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall style #1
- ```hoon
  %_  a=wing
    b=wing  c=hoon
    d=wing  e=hoon
    f=wing  g=hoon
  ==
  ```

---

- Tall style #2
- ```hoon
  %_    a=wing
      b=wing
    c=hoon
  ::
      d=wing
    e=hoon
  ::
      f=wing
    g=hoon
  ==
  ```

---

- Wide
- ```hoon
  %_(a=wing b=wing c=hoon, d=wing e=hoon, ...)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%cncb p=wing q=(list (pair wing hoon))]
```

#### Expands to

```hoon
^+(a %=(a b c, d e, ...))
```

#### Semantics

A `%_` expression resolves to the value of the subject at wing `a`, but modified
according to a series of changes: `b` is replaced with the product of `c`, `d`
with the product of `e`, and so on. At compile time a type check is performed to
ensure that the resulting value is of the same type as `a`.

#### Discussion

`%_` is different from `%=` because `%=` can change the type of a wing with
mutations. `%_` preserves the wing type.

See [how wings are resolved](/reference/hoon/limbs/).

#### Examples

```
> =foo [p=42 q=6]

> foo(p %baz)
[p=%baz q=6]

> foo(p [55 99])
[p=[55 99] q=6]

> %_(foo p %baz)
[p=7.496.034 99]

> %_(foo p [55 99])
! nest-fail
```

---

