## `%=` "centis"

Resolve a wing with changes.

#### Syntax

One fixed argument, then a variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall style #1
- ```hoon
  %=  a=wing
    b=wing  c=hoon
    d=wing  e=hoon
         ...
    f=wing  g=hoon
  ==
  ```

---

- Tall style #2
- ```hoon
  %=    a=wing
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
  %=(a b c, d e, f g)
  ```

---

- Irregular
- ```
    a(b c, d e, f g)
  ```
{% /table %}

#### AST

```hoon
[%cnts p=wing q=(list (pair wing hoon))]
```

#### Semantics

A `%=` expression resolves a wing of the subject, but with changes made.

If `a` resolves to a leg, a series of changes are made to wings of that leg
(`b`, `d`, and `f` above are replaced with the respective products of `c`, `e`,
and `g` above). The modified leg is returned.

If `a` resolves to an arm, a series of changes are made to wings of the parent
core of that arm. (Again, `b`, `d`, and `f` are replaced with the respective
products of `c`, `e`, and `g`.) The arm is computed with the modified core as
the subject, and the product is returned.

#### Discussion

Note that `a` is a wing, not just any expression. Knowing that a function call
`(foo baz)` involves evaluating `foo`, replacing its sample at slot `+6` with
`baz`, and then resolving to the `$` limb, you might think `(foo baz)` would
mean `%=(foo +6 baz)`.

But it's actually `=+(foo =>(%=(+2 +6 baz:+3) $))`. Even if `foo` is a wing, we
would just be mutating `+6` within the core that defines the `foo` arm. Instead
we want to modify the **product** of `foo`—the gate—so we have to pin it
into the subject.

Here's that again in tall form:

```hoon
=+  foo
=>  %=  +2
      +6  baz:+3
    ==
  $
```

#### Examples

```
> =foo [p=5 q=6]

> foo(p 42)
[p=42 q=6]

> foo(+3 99)
[p=5 99]
```
