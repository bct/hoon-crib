## `?&` "wutpam"

Logical AND.

#### Syntax

Variable arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?&  p1
      p2
      pn
  ==
  ```

---

- Wide
- ```hoon
  ?&(p1 p2 pn)
  ```

---

- Irregular
- ```
    &(p1 p2 pn)
  ```
{% /table %}

#### AST

```hoon
[%wtpm p=(list hoon)]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `p`:

```hoon
?.(a | ?.(b | ?.(c | ?.(... ?.(z | &)))))
```

#### Desugaring

```hoon
|-
?~  p
  &
?.  i.p
  |
$(p t.p)
```

#### Produces

If ALL arguments evaluate to true (`%.y`), true (`%.y`). If one or more evalute
to false (`%.n`), false (`%.n`).

#### Examples

```
> &(=(6 6) =(42 42))
%.y

> &(=(6 7) =(42 42))
%.n
```

---

