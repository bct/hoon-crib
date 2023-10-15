## `^|` "ketbar"

Convert a gold core to an iron core (contravariant).

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^|  p
  ```

---

- Wide
- ```hoon
  ^|(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktbr p=hoon]
```

#### Produces

`p` as an iron core; crash if not a gold core.

#### Discussion

An iron core is an opaque function (gate or door).

Theorem: if type `x` nests within type `a`, and type `y` nests
within type `b`, a core accepting `b` and producing `x` nests
within a iron core accepting `y` and producing `a`.

Informally, a function fits an interface if the function has a
more specific result and/or a less specific argument than the
interface.

#### Examples

The prettyprinter shows the core metal (`.` gold, `|` iron):

```
~zod:dojo> |=(@ 1)
<1.gcq [@  @n <250.yur 41.wda 374.hzt 100.kzl 1.ypj %151>]>

~zod:dojo> ^|(|=(@ 1))
<1|gcq [@  @n <250.yur 41.wda 374.hzt 100.kzl 1.ypj %151>]>
```

---

