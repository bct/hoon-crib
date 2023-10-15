## `?-` "wuthep"

Switch against a union, with no default.

#### Syntax

One fixed argument, then a variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall style #1
- ```hoon
  ?-  p
    q1a  q1b
    q2a  q2b
    qna  qnb
  ==
  ```

---

- Tall style #2
- ```hoon
  ?-    p
      q1a
    q1b
  ::
      q2a
    q2b
  ::
      qna
    qnb
  ==
  ```

---

- Wide
- ```hoon
  ?-(p q1a q1b, q2a q2b, qna qnb)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wthp p=wing q=(list (pair spec hoon))]
```

#### Expands to

**Pseudocode**: `a`, `b`, `c`, ... as elements of `q`:

```hoon
?:  ?=(p.a p)  q.a
?:  ?=(p.b p)  q.b
?:  ?=(p.c p)  q.c
...
~|(%mint-lost !!)
```

#### Desugaring

```hoon
|-
?.  q
  ~|(%mint-lost !!)
?:  ?=(p.i.q p)
  q.i.q
$(q t.q)
```

#### Discussion

The `?-` rune is for a conditional expression in which the type of `p`
determines which branch is taken. Usually the type of `p` is a union of other
types. There is no default branch.

The compiler makes sure that your code neither misses a case of the union, nor
includes a double case that isn't there. This is not special handling for `?-`,
just a consequence of the semantics of `?:`, which `?-` reduces to.

A missing case will throw the `mint-lost` error. An extra case will throw
`mint-vain`.

#### Examples

```
> =cor |=  vat=?(%a %b)
       ?-  vat
         %a  20
         %b  42
       ==

> (cor %a)
20

> (cor %b)
42

> (cor %c)
! nest-fail
```

---

## `?:` "wutcol" {% #-wutcol %}

Branch on a boolean test.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?:  p
    q
  r
  ```

---

- Wide
- ```hoon
  ?:(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtcl p=hoon q=hoon r=hoon]
```

#### Produces

If `p` produces true (`%.y`), then `q`. If `p` produces false (`%.n`), then `r`.
If `p` is not a boolean, compiler yells at you.

#### Discussion

If test analysis reveals that either branch is never taken, or if `p` is not a
boolean, compilation fails. An untaken branch is indicated with `mint-lost`.

Note also that all other branching expressions reduce to `?:`.

#### Examples

```
> ?:((gth 1 0) 3 4)
3

> ?:  (gth 1 0)
    3
  4
3

> ?:((gth 1 2) 3 4)
4

> ?:  (gth 1 2)
    3
  4
4
```

---

