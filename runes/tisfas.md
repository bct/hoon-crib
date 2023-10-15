## `=/` "tisfas"

Combine a named noun with the subject, possibly with type annotation.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =/  p
    q
  r
  ```

---

- Wide
- ```hoon
  =/(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tsfs p=skin q=hoon r=hoon]
```

#### Expands to

if `p` is a name, (e.g. `a`):

```hoon
=+(^=(p q) r)
```

if `p` is a name with a type (e.g., `a=@`):

```hoon
=+(^-(p q) r)
```

#### Desugaring

```hoon
?@  p
  =+  p=q
  r
=+  ^-($=(p.p q.p) q)
r
```

#### Discussion

`p` can be either a name or a `name=type`. If it's just a name, `=/` ("tisfas")
"declares a type-inferred variable." If it has a type, `=/` "declares a
type-checked variable."

#### Examples

```
> =/  a=@t  'hello'  a
'hello'

> =/  x  [1 2 3]  x
[1 2 3]

> =foo |=  a=@
       =/  b  1
       =/  c=@  2
       :(add a b c)
> (foo 5)
8
```

---

