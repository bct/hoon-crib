## `.+` "dotlus"

Increment an atom with Nock `4`.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  .+  p
  ```

---

- Wide
- ```hoon
  .+(p)
  ```

---

- Irregular
- ```hoon
    +(p)
  ```
{% /table %}

#### AST

```hoon
[%dtls p=hoon]
```

#### Produces

`p` plus `1` if `p` is an atom; otherwise, crashes. The product atom has no aura.

#### Examples

```
> .+(6)
7

> +(6)
7

> +(%foo)
7.303.015

> +([1 2])
nest-fail
```

---

