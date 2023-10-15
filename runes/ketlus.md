## `^+` "ketlus"

Typecast by inferred type.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^+  p
  q
  ```

---

- Wide
- ```hoon
  ^+(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktls p=hoon q=hoon]
```

#### Produces

The value of `q` with the type of `p`, if the type of `q` nests within the type
of `p`. Otherwise, `nest-fail`.

#### Examples

```
~zod:dojo> ^+('text' %a)
'a'
```

---

