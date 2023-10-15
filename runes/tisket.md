## `=^` "tisket"

Pin the head of a pair; change a leg with the tail.

#### Syntax

Four arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =^  p  q
    r
  s
  ```

---

- Wide
- ```hoon
  =^(p q r s)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tskt p=skin q=wing r=hoon s=hoon]
```

#### Expands to

```hoon
=/(p -.r =.(q +.r s))
```

#### Discussion

- `p` is a new name (optionally with type) to pin to the subject.
- `q` is the name of an existing wing of the subject.
- `r` is an expression that produces `[p-value new-q-value]`.
- `s` is some more code to be evaluted against the modified subject.

This is a bit like doing `=/` and `=.` at the same time. It's useful for state
machines, where you want to produce both effects and a new state. For example,
many arms of a Gall agent produce `[effects new-state]` in the form of a `(quip card _this)`. In the `++on-poke` arm, you might have something like:

```hoon
=^  cards  state
  (handle-poke !<(action vase))
[cards this]
```

This may also remind you of Haskell's State monad.

#### Examples

The `og` core is a stateful pseudo-random number generator.
We have to change the core state every time we generate a
random number, so we use `=^`:

```
~zod:dojo> =+  rng=~(. og 420)
           =^  r1  rng  (rads:rng 100)
           =^  r2  rng  (rads:rng 100)
           [r1 r2]
[99 46]
```

---

