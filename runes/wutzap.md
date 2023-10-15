## `?!` "wutzap"

Logical NOT.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?!  p
  ```

---

- Wide
- ```hoon
  ?!(p)
  ```

---

- Irregular
- ```hoon
    !p
  ```
{% /table %}

#### AST

```hoon
[%wtzp p=hoon]
```

#### Expands to

```hoon
.=(| p)
```

#### Produces

The logical NOT of `p`, which must evaluate to either `%.y` or `%.n`.

#### Examples

```
~zod:dojo> ?!(.=(1 2))
%.y

~zod:dojo> !&
%.n

~zod:dojo> !|
%.y

~zod:dojo> !(gth 5 6)
%.y
```
