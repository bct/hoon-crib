## `?>` "wutgar"

Positive assertion.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?>  p
  q
  ```

---

- Wide
- ```hoon
  ?>(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtgr p=hoon q=hoon]
```

#### Expands to

```hoon
?.(p !! q)
```

#### Discussion

`?>` is used to force a crash when some condition `p` doesn't yield true
(`%.y`). It can be used for type inference, with the `?=` rune, to specify the
type of a value.

#### Examples

```
> ?>(=(3 3) %foo)
%foo

> ?>(=(3 4) %foo)
dojo: hoon expression failed

> =a `*`123

> `@`a
nest-fail

> ?>(?=(@ a) `@`a)
123
```

---

