## `%.` "cendot"

Call a gate (function), inverted.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %.  a  b
  ```

---

- Wide
- ```hoon
  %.(a b)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%cndt p=hoon q=hoon]
```

#### Semantics

The `%.` rune is for evaluating the `$` arm of a gate, i.e., calling a function.
`a` is for the desired sample value (i.e., input value), and `b` is the gate.

#### Expands to

```hoon
%-(b=hoon a=hoon)
```

#### Discussion

`%.` is just like `%-`, but with its subexpressions reversed; the argument comes
first, and then the gate.

#### Examples

```
> =add-triple |=([a=@ b=@ c=@] :(add a b c))

> %.([1 2 3] add-triple)
6
```

---

## `%-` "cenhep" {% #-cenhep %}

Call a gate (function).

#### Syntax

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %-  a
  b
  ```

---

- Wide
- ```hoon
  %-(a b)
  ```

---

- Irregular
- ```hoon
    (a b)
  ```
{% /table %}

#### AST

```hoon
[%cnhp p=hoon q=hoon]
```

#### Semantics

This rune is for evaluating the `$` arm of a gate, i.e., calling a gate as a
function. `a` is the gate, and `b` is the desired sample value (i.e., input
value) for the gate.

#### Expands to

```hoon
%~($ a b)
```

#### Discussion

`%-` is used to call a function; `a` is the function
([`gate`](/reference/hoon/rune/bar#-bartis), `q` the argument. `%-` is a
special case of [`%~` ("censig")](#-censig), and a gate is a special case of a
[door](/reference/hoon/rune/bar#_-barcab).

#### Examples

```
> =add-triple |=([a=@ b=@ c=@] :(add a b c))

> (add-triple 1 2 3)
6

> %-(add-triple [1 2 3])
6
```

---

