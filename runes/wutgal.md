## `?<` "wutgal"

Negative assertion.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?<  p
  q
  ```

---

- Wide
- ```hoon
  ?<(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtgl p=hoon q=hoon]
```

#### Expands to

```hoon
?:(p !! q)
```

#### Discussion

`?<` is used to force a crash when some condition `p` doesn't yield false
(`%.n`). It can be used for type inference with the `?=` rune, much like the
`?>` rune.

#### Examples

```
> ?<(=(3 4) %foo)
%foo

> ?<(=(3 3) %foo)
dojo: hoon expression failed

> =a `*`[12 14]

> `^`a
nest-fail

> ?<(?=(@ a) `^`a)
[12 14]
```

---

