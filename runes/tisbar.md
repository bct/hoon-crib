## `=|` "tisbar"

Combine a named noun with the subject by "bunting" (producing the default value)
of a given mold.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =|  p
  q
  ```

---

- Wide
- ```hoon
  =|(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsbr p=spec q=hoon]
```

#### Expands to

```hoon
=+(*p q)
```

#### Discussion

The default (or 'bunt') value of `p` is pinned to the head of the subject.
Usually `p` includes a name for ease of reference.

Speaking more loosely, `=|` usually "declares a variable" which is
"uninitialized," presumably because you'll set it in a loop or similar.

#### Examples

```
> =|  a=@ud  a
0

> =|  a=[@t @t @t]  a
['' '' '']
```

---

