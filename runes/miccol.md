## `;:` "miccol"

Call a binary function as an n-ary function.

#### Syntax

One fixed argument, then a variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;:  p
    q1
    q2
    qn
  ==
  ```

---

- Wide
- ```hoon
  ;:(p q1 q2 qn)
  ```

---

- Irregular
- ```
    :(p q1 q2 qn)
  ```
{% /table %}

#### AST

```hoon
[%mccl p=hoon q=(list hoon)]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `q`:

Regular form:

```hoon
%-(p a %-(p b %-(p c ...)))
```

Irregular form:

```hoon
(p a (p b (p c ...)))
```

#### Desugaring

```hoon
|-
?~  q  !!
?~  t.q  !!
?~  t.t.q
  (p i.q i.t.q)
(p i.q $(q t.q))
```

#### Examples

```
> (add 3 (add 4 5))
12

> ;:(add 3 4 5)
12

> :(add 3 4 5)
12

> `@t`:((cury cat 3) 'a' 'b' 'c' 'd')
'abcd'
```

---

