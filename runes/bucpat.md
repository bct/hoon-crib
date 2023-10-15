## `$@` "bucpat"

Structure which normalizes a union tagged by head depth (atom).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $@  p
  q
  ```

---

- Wide
- ```hoon
  $@(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bcpt p=spec q=spec]
```

#### Normalizes to

`p`, if the sample is an atom; `q`, if the sample is a cell.

#### Defaults to

The default of `p`.

#### Produces

A structure which applies `p` if its sample is an atom, `q` if its sample is a
cell.

#### Examples

```
> =a $@(%foo $:(p=%baz q=@ud))

> (a %foo)
%foo

> `a`[%baz 99]
[p=%baz q=99]

> $:a
%foo
```

---

