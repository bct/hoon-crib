## `=<` "tisgal"

Compose two expressions, inverted.

#### Syntax

Two arguments, fixed

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =<  p
  q
  ```

---

- Wide
- ```hoon
  =<(p q)
  ```

---

- Irregular
- ```
    p:q
  ```
{% /table %}

#### AST

```hoon
[%tsgl p=hoon q=hoon]
```

#### Expands to

```hoon
=>(q p)
```

#### Discussion

`=<` is just `=>` backwards.

#### Examples

```
> =<(b [a=1 b=2 c=3])
2

> =<  b
  [a=1 b=2 c=3]
2

> b:[a=1 b=2 c=3]
2

> [. .]:(add 2 4)
[6 6]
```

---

