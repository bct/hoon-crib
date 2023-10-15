## `!!` "zapzap"

Crash.

#### Syntax

No arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !!
  ```

---

- Wide
- ```
  !!
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpzp ~]
```

#### Produces

Nothing. Always crashes, with type `%void`.

#### Discussion

`%void` nests in every other type, so you can stub out anything with `!!`.

#### Examples

```
> !!
dojo: hoon expression failed
```

---

