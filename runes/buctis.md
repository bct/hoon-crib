## `$=` "buctis"

Structure which wraps a face around another structure.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $=  p
  q
  ```

---

- Wide
- ```hoon
  $=(p q)
  ```

---

- Irregular
- ```
    p=q
  ```
{% /table %}

#### AST

```hoon
[%bcts p=skin q=spec]
```

#### Expands to

```hoon
|=  *
^=(p %-(q +6))
```

#### Discussion

Note that the Hoon compiler is at least slightly clever about
compiling structures, and almost never has to actually put in a gate
layer (as seen in the expansion above) to apply a `$=`.

#### Examples

```
> =a $=(p %foo)

> (a %foo)
p=%foo

> (a %baz)
ford: %ride failed to execute:
```

---

