## `=:` "tiscol"

Change multiple legs in the subject.

#### Syntax

Two arguments: the first a variable number of pairs, the second is fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =:  p1a  p1b
      p2a  p2b
      p3a  p3b
    ==
  q
  ```

---

- Wide
- ```hoon
  =:(p1a p1b, p2a p2b, p3a p3b q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tscl p=(list (pair wing hoon)) q=hoon]
```

#### Expands to

```hoon
=>(%_(. p) q)
```

#### Discussion

This rune is like `=.`, but for modifying the values of multiple legs of the subject.

#### Examples

```
> =+  a=[b=1 c=2]
  =:  c.a  4
      b.a  3
    ==
  a
[b=3 c=4]
```

---

