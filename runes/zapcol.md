## `!:` "zapcol"

Turn on stack trace.

#### Syntax

One argument, fixed

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !:  p
  ```

---

- Wide
- ```hoon
  !:(p)
  ```

---

- Irregular
- None.
{% /table %}

#### Produces

The product of `p` unless `p` crashes, in which case a stack trace is given.

#### Discussion

`!:` is used to turn on a debugging stack trace option for any code you have in
`p`.

#### Examples

```
> ?:(=(0 1) 123 !!)
dojo: hoon expression failed

> !:  ?:(=(0 1) 123 !!)
/~zod/base/~2022.4.2..08.54.53..07d7:<[1 5].[1 22]>
/~zod/base/~2022.4.2..08.54.53..07d7:<[1 19].[1 21]>
dojo: hoon expression failed
```

---

