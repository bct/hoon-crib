## `^:` "ketcol"

Switch parser into structure mode (mold definition) and produce a gate for type `p`.  (See [`,` com]() which toggles modes.)

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^:  p
  ```

---

- Wide
- ```hoon
  ^:(p)
  ```

---

- Irregular
- ```hoon
  ,p
  ```
{% /table %}

#### AST

```hoon
[%ktcl p=spec]
```

#### Produces

A gate that returns the sample value if it is of the correct type, but crashes
otherwise.

#### Discussion

`^:` is used to produce a mold that crashes if its sample is of the wrong type.

In structure mode, `[a=@ b=@]` is a mold for a cell, whereas in value mode it's
a pair of molds.  Sometimes you need a structure in value mode, in which you can
use `^:` or `,`.

Molds used to produced their bunt value if they couldn't mold their sample. This
is no longer the case: molds now crash if molding fails, so this rune is
redundant in certain cases.

One may expect that `^:(path /foo)` would result in a syntax error since `^:`
only takes one child, but instead it will parse as `=< ^ %:(path /foo)`. Since
`:` is the irregular syntax for `=<` this is is parsed as "get `^` (i.e. the
mold for cells) from a subject of `(path /foo)`", with `:` being the irregular
syntax for `=<`.

#### Examples

```
> ^:  @
< 1.goa
  { *
    {our/@p now/@da eny/@uvJ}
    <19.hqf 23.byz 5.mzd 36.apb 119.zmz 238.ipu 51.mcd 93.glm 74.dbd 1.qct $141>
  }
>

> (^:(@) 22)
22

> (^:(@) [22 33])
ford: %ride failed to execute:

> (,cord 55)
'7'

> (ream ',@t')
[%ktcl p=[%base p=[%atom p=~.t]]]

> (ream ',cord')
[%ktcl p=[%like p=~[%cord] q=~]]
```

---

