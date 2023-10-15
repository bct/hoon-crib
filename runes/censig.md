## `%~` "censig"

Evaluate an arm in a door.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  %~  p=wing  q=hoon
  r=hoon
  ```

---

- Wide
- ```hoon
  %~(p q r)
  ```

---

- Irregular
- ```
    ~(p q r1 r2 rn)
  ```
{% /table %}

In the irregular form, `r` may be split into multiple parts. Multiple parts of
`r` will be formed into a cell.

#### Semantics

A `%~` expression evaluates the arm of a door (i.e., a core with a sample). `p`
is a wing that resolves to the arm from within the door in question. `q` is the
door itself. `r` is the sample of the door.

#### Discussion

`%~` is the general case of a function call, `%-`. In both, we replace the sample (`+6`) of a core. In `%-` the core is a gate and the `$` arm is evaluated. In `%~` the core is a door and any arm may be evaluated. You must identify the arm to be run: `%~(arm door arg)`.

Note also that `p` is a wing and can therefore be `.`, as in `~(. door
sample)`. This little idiom lets you load your sample into the door once
instead of over and over.

See also [`|_`](/reference/hoon/rune/bar#_-barcab).

#### Examples

```
> =mycore |_  a=@
          ++  plus-two  (add 2 a)
          ++  double  (mul 2 a)
          ++  mul-by
            |=  b=@
            (mul a b)
          --

> ~(plus-two mycore 10)
12

> ~(double mycore 10)
20

>  =tencore ~(. mycore 10)
>  (mul-by:tencore 5)
50
```

---

