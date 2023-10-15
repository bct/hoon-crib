## `%^` "cenket"

Call gate with triple sample.

#### Syntax

Four arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %^    a
      b
    c
  d
  ```

---

- Wide
- ```hoon
  %^(a b c d)
  ```

---

- Irregular
- ```hoon
    (a b c d)
  ```
{% /table %}

#### AST

```hoon
[%cnkt p=hoon q=hoon r=hoon s=hoon]
```

#### Expands to

```hoon
%-(a=hoon [b=hoon c=hoon d=hoon])
```

#### Examples

```
> =add-triple |=([a=@ b=@ c=@] :(add a b c))

> %^(add-triple 1 2 3)
6
```

---

