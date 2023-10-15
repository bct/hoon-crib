## `^~` "ketsig"

Fold constant at compile time.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^~  p
  ```

---

- Wide
- ```hoon
  ^~(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktsg p=hoon]
```

#### Produces

`p`, folded as a constant if possible.

#### Examples

```
> (make '|-(42)')
[%8 p=[%1 p=[1 42]] q=[%9 p=2 q=[%0 p=1]]]

> (make '^~(|-(42))')
[%1 p=42]
```

---

