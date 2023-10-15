## `!;` "zapmic"

Wrap a noun in its type (raw).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !;  p
  q
  ```

---

- Wide
- ```hoon
  !;(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpmc p=hoon q=hoon]
```

#### Discussion

This wraps the product of `q` in its inferred type. It's a raw version of
[`!>`](#-zapgar). Unlike zapgar, `q` is not given a `p` face and its type
information is not stripped to a raw noun.

The first field, `p`, must be an example of the
[`$type`](/reference/hoon/stdlib/4o#type) type, typically just `*type` (the
bunt of `$type`). The `p` argument is just so transitions can be handled if the
`$type` type changes.

It's unlikely you'd use this rune directly; [`!>`](#-zapgar) is much more
typical.

#### Examples

```
> !;  *type  [1 1]
[#t/[@ud @ud] 1 1]

> !;  *type  'foo'
[#t/@t 'foo']
```

---

