## `~>` "siggar"

Raw hint, applied to computation.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~>  p
  q
  ```

---

- Wide
- ```hoon
  ~>(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sggr p=$@(term [p=term q=hoon]) q=hoon]
```

#### Expands to

`q`.

#### Semantics

`p` may either be a single `%term` or a pair of `[term hoon]`, the latter of
which may optionally be be written `%foo.some-hoon`. `p` will be passed to the
interpreter and `q` will be evaluated and its result produced like normal.

#### Discussion

Hoon has no way of telling what hints are used and what aren't.
Hints are all conventions at the interpreter level.

#### Examples

```
> ~>(%a 42)
42
```

Running the compiler:

```
> (make '~>(%a 42)')
[%11 p=97 q=[%1 p=42]]

> (make '~>(%a.+(2) 42)')
[%11 p=[p=97 q=[%4 p=[%1 p=2]]] q=[%1 p=42]]
```

---

