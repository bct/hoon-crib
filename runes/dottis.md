## `.=` "dottis"

Test for equality with Nock `5`.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  .=  p
  q
  ```

---

- Wide
- ```hoon
  .=(p q)
  ```

---

- Irregular
- ```hoon
    =(p q)
  ```
{% /table %}

#### AST

```hoon
[%dtts p=hoon q=hoon]
```

#### Produces

`%.y` if `p` equals `q`; otherwise `%.n`.

#### Discussion

Like Nock equality, `.=` ("dottis") tests whether two nouns are the same,
ignoring invisible pointer structure. Because in a conventional noun
implementation each noun has a lazy short hash, comparisons are fast unless the
hash needs to be computed, or we are comparing separate copies of identical
nouns. (Comparing large duplicates is a common cause of performance bugs.)

#### Examples

```
> .=(0 0)
%.y

> =(0 0)
%.y

> .=(1 2)
%.n

> =(1 2)
%.n

> =(12 [12 14])
%.n
```

---

