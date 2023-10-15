## `?~` "wutsig"

Branch on whether a wing of the subject is null.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?~  p
    q
  r
  ```

---

- Wide
- ```hoon
  ?~(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtsg p=wing q=hoon r=hoon]
```

#### Expands to

```hoon
?:(?=($~ p) q r)
```

#### Produces

If `p` is null (`~`), `q`. If `p` is non-null, `r`.

#### Discussion

It's bad style to use `?~` to test for any zero atom. Use it only for a true
null, `~`.

#### Examples

```
> =foo ""

> ?~(foo 1 2)
1
```

---

