## `=;` "tismic"

Combine a named noun with the subject, possibly with type annotation; inverted
order.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =;  p
    q
  r
  ```

---

- Wide
- ```hoon
  =;(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsmc p=skin q=hoon r=hoon]
```

#### Expands to

```hoon
=/(p r q)
```

#### Discussion

`=;` is exactly like `=/` except that the order of its last two subexpressions
is reversed.

#### Examples

```
> =foo |=  a=@
       =/   b  1
       =;   c=@
         :(add a b c)
       2
> (foo 5)
8
```

---

