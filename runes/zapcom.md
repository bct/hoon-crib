## `!,` "zapcom"

Produce the Hoon AST of an expression.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !,  p
  q
  ```

---

- Wide
- ```hoon
  !,(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpcm p=hoon q=hoon]
```

#### Discussion

This produces the [`$hoon`](/reference/hoon/stdlib/4o#hoon) AST of
expression `q`. The first argument, `p`, is always an example of the `$hoon`
type, typically just the `*hoon` bunt value, and is used for type inference. The
reason for `p` is just to handle transitions if the `$hoon` type changes.

#### Examples

```
> !,  *hoon  [1 1]
[%cltr p=~[[%sand p=%ud q=1] [%sand p=%ud q=1]]]

> !,  *hoon  (add 1 1)
[%cncl p=[%wing p=~[%add]] q=~[[%sand p=%ud q=1] [%sand p=%ud q=1]]]
```

---

