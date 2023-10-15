## `;;` "micmic"

Normalize with a mold, asserting fixpoint.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;;  p
  q
  ```

---

- Wide
- ```hoon
  ;;(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%mcmc p=spec q=hoon]
```

#### Expands to

```hoon
=+  a=(p q)
?>  =(`*`a `*`q)
a
```

> Note: the expansion implementation is hygienic -- it doesn't actually add the `a` face to the subject.

#### Examples

Fails because of auras:

```
> ^-(tape ~[97 98 99])
mint-nice
-need.?(%~ [i=@tD t=""])
-have.[@ud @ud @ud %~]
nest-fail
dojo: hoon expression failed
```

Succeeds because molds don't care about auras:

```
> ;;(tape ~[97 98 99])
"abc"
```

Fails because not a fixpoint:

```
> ;;(tape [50 51 52])
dojo: hoon expression failed
```

---

