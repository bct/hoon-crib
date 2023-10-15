## `~?` "sigwut"

Conditional debug printf.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~?  p
    q
  r
  ```

---

- Wide
- ```hoon
  ~?(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgwt p=hoon q=hoon r=hoon]
```

#### Expands to

`r`.

#### Convention

If `p` is true, prettyprints `q` on the console before computing `r`.

#### Examples

```
> ~?((gth 1 2) 'oops' ~)
~

> ~?((gth 1 0) 'oops' ~)
'oops'
~

> ~?  (gth 1 2)
    'oops'
  ~
~

> ~?  (gth 1 0)
    'oops'
  ~
'oops'
~
```

---

