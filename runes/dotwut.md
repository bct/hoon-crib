## `.?` "dotwut"

Test for cell or atom with Nock `3`.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  .?  p
  ```

---

- Wide
- ```hoon
  .?(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%dtwt p=hoon]
```

#### Produces

`%.y` if `p` is a cell; otherwise `%.n`.

#### Examples

```
> .?(42)
%.n

> .?([42 43])
%.y
```
