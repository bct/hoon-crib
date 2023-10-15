## `~<` "siggal"

Raw hint, applied to product.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~<  p
  q
  ```

---

- Wide
- ```hoon
  ~<(p q)
  ```

---

- Irregular
- None.
{% /table %}

`p` may either be a a `term` or a pair of `[term hoon]`. If it's the latter, `p`
may optionally be written as `%foo.some-hoon`.

#### AST

```hoon
[%sggl p=$@(term [p=term q=hoon]) q=hoon]
```

#### Expands to

`q`.

#### Discussion

`~<` is only used for jet hints ([`~/`](#-sigfas) and [`~%`](#-sigcen)) at the
moment; we are not telling the interpreter something about the computation we're
about to perform, but rather about its product.

#### Examples

```
> (make '~<(%a 42)')
[%7 p=[%1 p=42] q=[%11 p=97 q=[%0 p=1]]]
> (make '~<(%a.+(.) 42)')
[%7 p=[%1 p=42] q=[%11 p=[p=97 q=[%4 p=[%0 p=1]]] q=[%0 p=1]]]
```

---

