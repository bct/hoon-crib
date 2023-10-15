## `!?` "zapwut"

Restrict Hoon version.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !?  p
  q
  ```

---

- Wide
- ```hoon
  !?(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpwt p=$@(p=@ [p=@ q=@]) q=hoon]
```

#### Produces

When `p` is an atom:

- `q` if `p` ≥ Hoon kelvin version, otherwise crash.

When `p` is a cell:

- `q`, if `p.p` ≥ Hoon kelvin version ≥ `q.p`, otherwise crash.

(Versions count down; the current version is 140.)

#### Examples

```
> !?  [142 140]  (add 2 2)
4

> !?  142  (add 2 2)
4

> !?  64  (add 2 2)
! exit
```

---

