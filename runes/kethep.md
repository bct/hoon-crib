## `^-` "kethep"

Typecast by explicit type label.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ^-  p
  q
  ```

---

- Wide
- ```hoon
  ^-(p q)
  ```

---

- Irregular
- ```
    `p`q
  ```
{% /table %}

#### AST

```hoon
[%kthp p=spec q=hoon]
```

#### Expands to

```hoon
^+(^*(p) q)
```

#### Discussion

It's a good practice to put a `^-` ("kethep") at the top of every arm
(including gates, loops, etc). This cast is strictly necessary
only in the presence of head recursion (otherwise you'll get a
`rest-loop` error, or if you really screw up spectacularly an
infinite loop in the compiler).

#### Examples

```
~zod:dojo> (add 90 7)
97

~zod:dojo> `@t`(add 90 7)
'a'

~zod:dojo> ^-(@t (add 90 7))
'a'

/~zod:dojo> =foo |=  a=@
                 ^-  (unit @ta)
                 `a

/~zod:dojo> (foo 97)
[~ ~.a]
```

