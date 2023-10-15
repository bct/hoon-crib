## `!.` "zapdot"

Turn off stack trace for a subexpression `p`

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !.  p
  ```

---

- Wide
- ```hoon
  !.(p)
  ```

---

- Irregular
- None.
{% /table %}

#### Produces

The product of `p`. If `p` crashes, no stack trace entries are given for that code.

#### Discussion

`!.` is used to turn off a debugging stack trace option for any code you have in
`p`. This rune can be embedded under a `!:` rune for inner loops of your code
that you don't want or need to trace. This is especially useful if a trace
overflows the stack.

#### Examples

```
> %.(1 |=(a=@ ^-(@ ?:(=(a 10) !! $(a +(a))))))
dojo: hoon expression failed

> !:  %.(1 |=(a=@ ^-(@ ?:(=(a 10) !! $(a +(a))))))
/~zod/base/~2022.4.2..08.56.45..5ecc:<[1 5].[1 49]>
/~zod/base/~2022.4.2..08.56.45..5ecc:<[1 17].[1 47]>
/~zod/base/~2022.4.2..08.56.45..5ecc:<[1 22].[1 46]>
...skipping some lines...
/~zod/base/~2022.4.2..08.56.45..5ecc:<[1 22].[1 46]>
/~zod/base/~2022.4.2..08.56.45..5ecc:<[1 33].[1 35]>
dojo: hoon expression failed

> !:  %.(1 !.(|=(a=@ ^-(@ ?:(=(a 10) !! $(a +(a)))))))
/~zod/base/~2022.4.2..08.57.07..d40b:<[1 5].[1 53]>
dojo: hoon expression failed
```

---
