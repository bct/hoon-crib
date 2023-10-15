## `$+` "buclus"

Specify a shorthand type name for use in prettyprinting.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $+  p
  q
  ```

---

- Wide
- ```hoon
  $+(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bcls p=stud q=spec]
```

<!--
#### Normalizes to

Default, if the sample is an atom; `p`, if the head of the sample
is an atom; `q` otherwise.

#### Defaults to

The default of `p`.
-->

#### Examples

```
> =/  my-type  $+(my-alias [@ @])

> -:!>(*my-type)
#t/#my-alias
```

---

