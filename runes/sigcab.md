## `~_` "sigcab"

User-formatted tracing printf.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~_  p
  q
  ```

---

- Wide
- ```hoon
  ~_(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgcb p=hoon q=hoon]
```

#### Expands to

`q`.

#### Convention

Shows `p` in stacktrace if `q` crashes.

#### Discussion

`p` must produce a `tank` (pretty-print source).

#### Examples

```
> ~_([%leaf "sample error message"] !!)
sample error message
dojo: hoon expression failed

> ~_  [%leaf "sample error message"]
  !!
sample error message
dojo: hoon expression failed
```

---

