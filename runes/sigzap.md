## `~!` "sigzap"

Print type on compilation fail.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~!  p
  q
  ```

---

- Wide
- ```hoon
  ~!(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgzp p=hoon q=hoon]
```

#### Expands to

`q`.

#### Convention

If compilation of `q` fails, prints the type of `p` in the trace.

#### Examples

```
> a
! -find.a

> ~!('foo' a)
! @t
! find.a

> ~!  'foo'
  a
! @t
! find.a
```
