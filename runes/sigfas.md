## `~/` "sigfas"

Jet registration for gate with registered context.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~/  p
  q
  ```

---

- Wide
- ```hoon
  ~/(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgfs p=term q=hoon]
```

#### Expands to

```hoon
~%(p +7 ~ q)
```

#### Examples

From the kernel:

```hoon
++  add
  ~/  %add
  |=  [a=@ b=@]
  ^-  @
  ?:  =(0 a)  b
  $(a (dec a), b +(b))
```

---

