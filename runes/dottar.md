## `.*` "dottar"

Evaluate with Nock `2`.

#### Produces

Nock of formula `q` and subject `p`, with type `%noun`.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  .*  p
  q
  ```

---

- Wide
- ```hoon
  .*(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%dttr p=hoon q=hoon]
```

#### Discussion

`.*(p q)` is used to run Nock formula `q` on the subject `p` from within Hoon.

Keep in mind that `p` and `q` can be arbitrary Hoon expressions, as long as they evaluate to the appropriate nouns for Nock evaluation.

Note also that `.*` ("dottar") can be used to bypass the type system. It's
therefore possible to use Hoon as a typeless language.

#### Examples

```
> .*([20 30] [0 2])
20

> .*(33 [4 0 1])
34

> .*(|.(50) [9 2 0 1])
50

> .*(12 [7 [`1 [4 `1]] [`2 `3 `2]])
[12 13 12]

> .*(~ [5 1^4 [4 1^3]])
0

> .*(~ [5 1^5 [4 1^3]])
1
```

---

