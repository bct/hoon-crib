## `=>` "tisgar"

Compose two expressions.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =>  p
  q
  ```

---

- Wide
- ```hoon
  =>(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsgr p=hoon q=hoon]
```

#### Produces

the product of `q`, with the product of `p` taken as the subject.

#### Examples

```
> =>([a=1 b=2 c=3] b)
2

> =>  9  .
9

> =>((add 2 4) [. .])
[6 6]

> =>
  |%
  ++  foo
    |=  [a=@ b=@]
    [b a]
  --
  (foo 42 27)
[27 42]
```

---

