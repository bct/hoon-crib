## `=.` "tisdot"

Change one leg in the subject.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =.  p  q
  r
  ```

---

- Wide
- ```hoon
  =.(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsdt p=wing q=hoon r=hoon]
```

#### Expands to

```hoon
=>(%_(. p q) r)
```

#### Discussion

Technically the `=.` rune doesn't change the subject. It creates a new subject
just like the old one except for a changed value at `p`. Note that the mutation
uses [`%_` ("cencab")](/reference/hoon/rune/cen#_-cencab), so the type at `p`
doesn't change. Trying to change the value type results in a `nest-fail`.

#### Examples

```
> =+  a=[b=1 c=2]
  =.  b.a  3
  a
[b=3 c=2]

> =+  a=[b=1 c=2]
  =.(b.a 3 a)
[b=3 c=2]

> =+  a=[b=1 c=2]
  =.(b.a "hello" a)
nest-fail
```

---

