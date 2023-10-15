## `;/` "micfas"

Tape as XML element.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;/  p
  ```

---

- Wide
- ```hoon
  ;/(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%mcnt p=hoon]
```

#### Expands to

```hoon
~[%$ ~[%$ 'p']]
```

#### Examples

```
> ;/  "foo"
[[%~. [%~. "foo"] ~] ~]
```

---

