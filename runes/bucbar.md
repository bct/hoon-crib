## `$|` "bucbar"

Structure that satisfies a validator.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $|  p
  q
  ```

---

- Wide
- ```hoon
  $|(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%bcbr p=spec q=hoon]
```

#### Discussion

`$|` is used for validation of values at a finer level than that of types.
Recall that a given value of `type` can be equivalently defined by more than one
`spec`. For performance reasons, it may be beneficial to restrict oneself to
values of a given type that adhere to an abstract syntax tree specified by some
subset of those `spec`s that may be used to define a given type.

`$|` takes two arguments: a structure `a` and a gate `b` that produces a `flag`
that is used to validate values produced by the mold generated by `a` at
runtime. `$|(a b)` is a gate that takes in a noun `x` and first pins the product
of clamming `a` with `x`, call this `foo`. Then it calls `b` on `foo`. It
asserts that the product of `(b foo)` is `&`, and then produces `foo`. This is
equivalent to the following (which is not how `$|` is actually defined but has
the same behavior):

```hoon
|=  x=*
=/  foo  ;;(a x)
?>  (b foo)
foo
```

For example, the elements of a `set` are treated as being unordered, but the
values will necessarily possess an order by where they are in the memory. Thus
if every `set` is stored using the same order scheme then faster algorithms
involving `set`s may be written. Furthermore, if you just place elements in the
`set` randomly, it may be mistreated by algorithms already in place that are
expecting a certain order. This is not the same thing as casting - it is forcing
a type to have a more specific set of values than its mold would suggest. This
rune should rarely be used, but it is extremely important when it is.

#### Examples

```
> =foo $|  (list @)
       |=(a=(list) (lth (lent a) 4))
```

This creates a structure `foo` whose values are `list`s with length less than 4.

```
> (foo ~[1 2 3])
~[1 2 3]

> (foo ~[1 2 3 4])
ford: %ride failed to execute:
```

The definition of `+set` in `hoon.hoon` is the following:

```hoon
++  set
  |$  [item]
  $|  (tree item)
  |=(a=(tree) ?:(=(~ a) & ~(apt in a)))
```

Here [`|$`](/reference/hoon/rune/bar#-barbuc) is used to define a mold
builder that takes in a mold (given the face `item`) and creates a structure
consisting of a `tree` of `item`s with `$|` that is validated with the gate
`|=(a=(tree) ?:(=(~ a) & ~(apt in a)))`. `in` is a door in `hoon.hoon` with
functions for handling `set`s, and `apt` is an arm in that door that checks that
the values in the `tree` are arranged in the particular way that `set`s are
arranged in Hoon, namely 'ascending `+mug` hash order'.

---
