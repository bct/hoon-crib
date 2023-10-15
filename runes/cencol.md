## `%:` "cencol"

Call a gate with many arguments.

#### Syntax

One fixed argument, then a variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %:  a=hoon
    b=hoon
    c=hoon
     ...
    d=hoon
  ==
  ```

---

- Wide
- ```hoon
  %:(a b c d)
  ```

---

- Irregular
- ```hoon
    (a b c d)
  ```
{% /table %}

#### AST

```hoon
[%cncl p=hoon q=(list hoon)]
```

#### Semantics

A `%:` expression calls a gate with many arguments. `a` is the gate to be
called, and `b` through `d` are the arguments. If there is only one
subexpression after `a`, its product is the sample. Otherwise, a single argument
is constructed by evaluating all of `b` through `d` -- however many
subexpressions there are -- and putting the result in a cell: `[b c ... d]`.

#### Discussion

When `%:` is used in tall-form syntax, the series of expressions after `p` must be terminated with `==`.

#### Examples

```
> %:  add  22  33  ==
55

> =adder |=  a=*
         =+  c=0
         |-
         ?@  a  (add a c)
         ?^  -.a  !!
         $(c (add -.a c), a +.a)

> %:  adder  22  33  44  ==
99

> %:  adder  22  33  44  55  ==
154

> %:(adder 22 33 44)
99

> (adder 22 33 44)
99
```

---

