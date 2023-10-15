## `^?` "ketwut"

Convert any core to a lead core (bivariant).

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^?  p
  ```

---

- Wide
- ```hoon
  ^?(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktwt p=hoon]
```

#### Produces

`p` as a lead core; crash if not a core.

#### Discussion

A lead core is an opaque generator; the payload can't be read or
written.

Theorem: if type `x` nests within type `a`, a lead core producing
`x` nests within a lead core producing `a`.

Informally, a more specific generator can be used as a less
specific generator.

#### Examples

The prettyprinter shows the core metal (`.` gold, `?` lead):

```
> |=(@ 1)
<1.gcq [@  @n <250.yur 41.wda 374.hzt 100.kzl 1.ypj %151>]>

> ^?(|=(@ 1))
<1?gcq [@  @n <250.yur 41.wda 374.hzt 100.kzl 1.ypj %151>]>
```
