## `^*` "kettar"

Produce example type value.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^*  p
  ```

---

- Wide
- ```hoon
  ^*(p)
  ```

---

- Irregular
- ```hoon
    *p
  ```
{% /table %}

`p` is any structure expression.

#### AST

```hoon
[%kttr p=spec]
```

#### Produces

A default value (i.e., 'bunt value') of the type `p`.

#### Examples

Regular:

```
> ^*  @
0

> ^*  %baz
%baz

> ^*  ^
[0 0]

> ^*  ?
%.y
```

Irregular:

```
> *@
0

> *^
[0 0]

> *tape
""
```

---

