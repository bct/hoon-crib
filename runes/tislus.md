## `=+` "tislus"

Combine a new noun with the subject.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =+  p
  q
  ```

---

- Wide
- ```hoon
  =+(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsls p=hoon q=hoon]
```

#### Expands to

```hoon
=>([p .] q)
```

#### Discussion

The subject of the `=+` expression, call it `a`, becomes the cell `[p a]` for
the evaluation of `q`. That is, `=+` 'pins a value', `p`, to the head of the
subject.

Loosely speaking, `=+` is the simplest way of "declaring a variable."

#### Examples

```
> =+  42  -
42

> =+  x=42  x
42

> =+  [a='foo' b='bar']  a
'foo'
```

---

