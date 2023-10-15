## `?+` "wutlus"

Switch against a union, with a default.

#### Syntax

Two fixed arguments, then a variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall style #1
- ```hoon
  ?+  p  q
    r1a  r1b
    r2a  r2b
    rna  rnb
  ==
  ```

---

- Tall style #2
- ```hoon
  ?+    p  q
      r1a
    r1b
  ::
      r2a
    r2b
  ::
      rna
    rnb
  ==
  ```

---

- Wide
- ```hoon
  ?+(p q r1a r1b, r2a r2b, rna rnb)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtls p=wing q=hoon r=(list (pair spec hoon))]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `r`:

```hoon
?:  ?=(p.a p)  q.a
?:  ?=(p.b p)  q.b
?:  ?=(p.c p)  q.c
...
q
```

#### Desugaring

```hoon
|-
?.  r
  q
?:  ?=(p.i.r p)
  q.i.r
$(r t.r)
```

#### Discussion

The `?+` rune is for a conditional expression in which the type of `p`
determines which branch is taken. Usually the type of `p` is a union of other
types. If `p`'s type doesn't match the case for any given branch, the default
expression, `q`, is evaluated.

If there is a case that is never taken you'll get a `mint-vain` error.

#### Examples

```
> =cor |=  vat=@tas
       ?+  vat  240
         %a  20
         %b  42
       ==

> (cor %a)
20

> (cor %b)
42

> (cor %c)
240
```

---

