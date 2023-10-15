## `?.` "wutdot"

Branch on a boolean test, inverted.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?.  p
    q
  r
  ```

---

- Wide
- ```hoon
  ?.(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtdt p=hoon q=hoon r=hoon]
```

#### Expands to

```hoon
?:(p r q)
```

#### Discussion

`?.` is just like `?:`, but with its last two subexpressions reversed.

As is usual with inverted forms, use `?.` when the true-case expression is much
taller and/or wider than the false-case expression.

#### Examples

```
> ?.((gth 1 2) 3 4)
3

> ?.(?=(%a 'a') %not-a %yup)
%yup

> ?.  %.y
    'this false case is less heavy than the true case'
  ?:  =(2 3)
    'two not equal to 3'
  'but see how \'r is much heavier than \'q?'
'but see how \'r is much heavier than \'q?'
```

---

