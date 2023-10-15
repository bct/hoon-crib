## `:*` "coltar"

Construct an n-tuple.

#### Syntax

Variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :*  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  :*(p1 p2 p3 pn)
  ```

---

- Irregular
- ```
    [p1 p2 p3 pn]
  ```
{% /table %}

#### AST

```hoon
[%cltr p=(list hoon)]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `p`:

```hoon
:-(a :-(b :-(c :-(... z)))))
```

#### Desugaring

```hoon
|-
?~  p
  !!
?~  t.p
  i.p
:-  i.p
$(p t.p)
```

#### Examples

```
> :*(5 3 4 1 4 9 0 ~ 'a')
[5 3 4 1 4 9 0 ~ 'a']

> [5 3 4 1 4 9 0 ~ 'a']
[5 3 4 1 4 9 0 ~ 'a']

> :*  5
      3
      4
      1
      4
      9
      0
      ~
      'a'
  ==
[5 3 4 1 4 9 0 ~ 'a']
```

---

