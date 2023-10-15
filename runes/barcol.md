## `|:` "barcol"

Produce a gate with a custom sample.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |:  a
  b
  ```

---

- Wide
- ```hoon
  |:(a b)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brcl p=hoon q=hoon]
```

#### Semantics

`a` is a Hoon expression whose product type defines which values the gate accepts, and it usually includes a name (e.g., `n=1`). The product of `a` also serves as the default value of the sample. `b` is a Hoon expression that determines the product value of the gate.

#### Expands to

```hoon
=+  a
|.  b
```

#### Discussion

Pick your own default value for the sample. Note that `a` is an ordinary
expression, not a type; `|:` doesn't bunt a sample as [`|=`](#-bartis) does.

This is useful if you want a gate to have a sample of a particular type, but you don't want the default value of the gate to be the default value of that type.

#### Examples

```
> =add-ten |:(n=`@`2 (add n 10))

> (add-ten 10)
20

> (add-ten)
12
```

---

