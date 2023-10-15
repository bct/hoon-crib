## `^&` "ketpam"

Convert a core to a zinc core (covariant).

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^&  p
  ```

---

- Wide
- ```hoon
  ^&(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktpm p=hoon]
```

#### Produces

`p` as a zinc core; crash if `p` isn't a gold or zinc core.

#### Discussion

A zinc core has a read-only sample and an opaque context. See [Advanced types](/reference/hoon/advanced).

#### Examples

The prettyprinter shows the core metal in the arm labels `1.xoz` and `1&xoz`
below (`.` is gold, `&` is zinc):

```
> |=(@ 1)
< 1.xoz
  { @
    {our/@p now/@da eny/@uvJ}
    <19.hqf 23.byz 5.mzd 36.apb 119.zmz 238.ipu 51.mcd 93.glm 74.dbd 1.qct $141>
  }
>

> ^&(|=(@ 1))
< 1&xoz
  { @
    {our/@p now/@da eny/@uvJ}
    <19.hqf 23.byz 5.mzd 36.apb 119.zmz 238.ipu 51.mcd 93.glm 74.dbd 1.qct $141>
  }
>
```

You can read from the sample of a zinc core, but not change it:

```
> =mycore ^&(|=(a=@ 1))

> a.mycore
0

> mycore(a 22)
-tack.a
-find.a
ford: %slim failed:
ford: %ride failed to compute type:
```

---

