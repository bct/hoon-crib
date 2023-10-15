## `?|` "wutbar"

Logical OR.

#### Syntax

Variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?|  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  ?|(p1 p2 p3 pn)
  ```

---

- Irregular
- ```hoon
    |(p1 p2 p3 pn)
  ```
{% /table %}

#### AST

```hoon
[%wtbr p=(list hoon)]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `p`:

```hoon
?:(a & ?:(b & ?:(c & ?:(... ?:(z & |)))))
```

#### Desugaring

```hoon
|-
?~  p
  |
?:  i.p
  &
$(p t.p)
```

#### Produces

If any argument evaluates to true (`%.y`), true. If all arguments evaluate to
false (`%.n`), false.

#### Examples

```
> |(=(6 42) =(42 42))
%.y

> |(=(6 42) =(42 43))
%.n
```

---

