## `$-` "buchep"

Structure that normalizes to an example gate.

#### AST

```hoon
[%bchp p=spec q=spec]
```

#### Expands to

```hoon
$_  ^|
|=(p $:q)
```

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $-  p
  q
  ```

---

- Wide
- ```hoon
  $-(p q)
  ```

---

- Irregular
- None.
{% /table %}

`p` is the type the gate takes and `q` is the type the gate produces.

#### Discussion

Since a `$-` reduces to a [`$_`](#_-buccab), it is not useful for normalizing, just for typechecking. In particular, the existence of `$-`s does **not** let us send gates or other cores over the network!

#### Examples

```
> =foo $-(%foo %baz)

> ($:foo %foo)
%baz
```

---

