## `~|` "sigbar"

Tracing printf.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~|  p
  q
  ```

---

- Wide
- ```hoon
  ~|(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgbr p=hoon q=hoon]
```

#### Expands to

`q`.

#### Convention

Prettyprints `p` in stack trace if `q` crashes.

#### Examples

```
> ~|('sample error message' !!)
'sample error message'
dojo: hoon expression failed

> ~|  'sample error message'
  !!
'sample error message'
dojo: hoon expression failed
```

---

