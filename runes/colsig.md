## `:~` "colsig"

Construct a null-terminated list.

#### Syntax

Variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  :~  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  :~(p1 p2 p3 pn)
  ```

---

- Irregular
- ```
    ~[p1 p2 p3 pn]
  ```
{% /table %}

#### AST

```hoon
[%clsg p=(list hoon)]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `p`:

```hoon
:-(a :-(b :-(c :-(... :-(z ~)))))
```

#### Desugaring

```hoon
|-
?~  p
  ~
:-  i.p
$(p t.p)
```

#### Discussion

Note that this does not produce a `list` type, it just produces a
null-terminated n-tuple. To make it a proper `list` it must be cast or molded.

#### Examples

```
> :~(5 3 4 2 1)
[5 3 4 2 1 ~]

> ~[5 3 4 2 1]
[5 3 4 2 1 ~]

> :~  5
      3
      4
      2
      1
  ==
[5 3 4 2 1 ~]
```

---

