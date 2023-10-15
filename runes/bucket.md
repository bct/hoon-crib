## `$^` "bucket"

Structure which normalizes a union tagged by head depth (cell).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $^  p
  q
  ```

---

- Wide
- ```hoon
  $^(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bckt p=spec q=spec]
```

#### Normalizes to

Default, if the sample is an atom; `p`, if the head of the sample
is an atom; `q` otherwise.

#### Defaults to

The default of `p`.

#### Examples

```
> =a $%([%foo p=@ud q=@ud] [%baz p=@ud])

> =b $^([a a] a)

> (b [[%baz 33] [%foo 19 22]])
[[%baz p=33] [%foo p=19 q=22]]

> (b [%foo 19 22])
[%foo p=19 q=22]

> $:b
[%baz p=0]
```

---

