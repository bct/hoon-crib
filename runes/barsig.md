## `|~` "barsig"

Produce an iron gate.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |~  a
  b
  ```

---

- Wide
- ```hoon
  |~(a b)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brsg p=spec q=hoon]
```

#### Expands to

```hoon
^|  |=(a b)
```

#### Semantics

A `|~` expression produces an iron gate. `a` defines the sample, and `b` defines
the output value of the gate.

#### Discussion

See [this discussion of core variance models](/reference/hoon/advanced)

#### Examples

```
> =>  ~  ^+(|~(a=@ *@) |=(a=* *@))
<1|usl {a/@ $~}>
```

---

