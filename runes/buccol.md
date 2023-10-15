## `$:` "buccol"

Form a cell type.

#### Syntax

A variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $:  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  $:(p1 p2 p3 pn)
  ```

---

- Irregular (noun mode)
- ```hoon
  ,[p1 p2 p3 pn]
  ```

---

- Irregular (structure mode)
- ```hoon
    [p1 p2 p3 pn]
  ```
{% /table %}

#### AST

```hoon
[%bccl p=(list spec)]
```

#### Normalizes to

The tuple the length of `p`, normalizing each item.

#### Defaults to

The tuple the length of `p`.

#### Examples

```
> =foo $:(p=@ud q=@tas)

> (foo 33 %foo)
[p=33 q=%foo]

> `foo`[33 %foo]
[p=33 q=%foo]

> $:foo
[p=0 q=%$]
```

---

