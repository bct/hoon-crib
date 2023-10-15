## `!<` "zapgal"

Extracts a [`vase`](/reference/hoon/stdlib/4o#vase) to the given mold if
its type nests.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !<  p
  q
  ```

---

- Wide
- ```hoon
  !<(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpgl p=spec q=hoon]
```

#### Produces

The value of vase `q` typed with the type of mold `p` if possible, else a
`nest-fail`.

#### Discussion

This is something like a partial inverse to the `!>` rune and can be used to
extract a typed value from a `vase`.

#### Examples

```
> !<  @  !>  ~zod
0

> !<  @p  !>  0
nest-fail

> !<  tape  !>("foobar")
"foobar"
```

---

