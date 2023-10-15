## `=,` "tiscom"

Expose namespace.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =,  p
  q
  ```

---

- Wide
- ```hoon
  =,(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tscm p=hoon q=hoon]
```

#### Produces

`p` evaluates to a noun with some namespace. From within `q` you may access
`p`'s names without a wing path (i.e., you can use face `b` rather than `b.p`).

#### Discussion

This is especially useful for calling arms from an imported library core or for
calling arms from a stdlib core repeatedly. For example, JSON reparsers like
`so:dejs:format` and `of:dejs:format` can be called as `so` and `of` after
doing:

```hoon
=,  dejs:format
```

#### Examples

With an imported core:

```
> (sum -7 --7)
-find.sum
dojo: hoon expression failed

> (sum:si -7 --7)
--0

> =,  si  (sum -7 --7)
--0
```

With a dojo-defined face:

```
> =/  fan  [bab=2 baz=[3 qux=4]]
  =,  fan
  [bab qux.baz]
[2 4]
```

---

