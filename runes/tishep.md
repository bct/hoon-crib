## `=-` "tishep"

Combine a new noun with the subject, inverted.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =-  p
  q
  ```

---

- Wide
- ```hoon
  =-(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tshp p=hoon q=hoon]
```

#### Expands to

```hoon
=>([q .] p)
```

#### Discussion

`=-` is just like `=+` but its subexpressions are reversed. `=-` looks better
than `=+` when the expression you're pinning to the subject is much larger than
the expression that uses it.

#### Examples

```
> =foo |=  a=@
       =-  (add a b)
       :*  %a-bunch
           %of-stuff
           %here
           b=2
           %and-perhaps-more
       ==
> (foo 5)
7
```

---

