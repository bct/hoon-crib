## `^.` "ketdot"

Typecast on value produced by passing `q` to `p`.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^.  p
  q
  ```

---

- Wide
- ```hoon
  ^.(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%ktdt p=hoon q=hoon]
```

#### Expands to

```hoon
^+(%:(p q) q)
```

#### Discussion

`p` produces a gate and q is any Hoon expression.

`^.` is particularly useful when `p` is a gate that 'cleans up' the type information about some piece of data. For example, `limo` is used to turn a raw noun of the appropriate shape into a genuine list. Hence we can use `^.` to cast with `limo` and similar gates, ensuring that the product has the desired type.

#### Examples

```
> =mylist [11 22 33 ~]

> ?~(mylist ~ i.mylist)
mint-vain

> =mylist ^.(limo mylist)

> ?~(mylist ~ i.mylist)
11

> ?~(mylist ~ t.mylist)
~[22 33]
```

---

