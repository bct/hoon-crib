## `:+` "collus"

Construct a triple (3-tuple).

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :+  p
    q
  r
  ```

---

- Wide
- ```hoon
  :+(p q r)
  ```

---

- Irregular
- ```hoon
    [p q r]
  ```
{% /table %}

#### AST

```hoon
[%clls p=hoon q=hoon r=hoon]
```

#### Expands to:

```hoon
:-(p :-(q r))
```

#### Examples

```
> :+  1
    2
  3
[1 2 3]

> :+(%a ~ 'b')
[%a ~ 'b']
```

---

