## `$_` "buccab"

Structure that normalizes to an example.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $_  p
  ```

---

- Wide
- ```hoon
  $_(p)
  ```

---

- Irregular
- ```
    _p
  ```
{% /table %}

#### AST

```hoon
[%bccb p=hoon]
```

#### Expands to

```hoon
|=(* p)
```

#### Discussion

`$_` discards the sample it's supposedly normalizing and produces its
**example** instead.

#### Examples

```
> =foo $_([%foobaz %moobaz])

> (foo %foo %baz)
[%foobaz %moobaz]

> `foo`[%foobaz %moobaz]
[%foobaz %moobaz]

> $:foo
[%foobaz %moobaz]
```

---

