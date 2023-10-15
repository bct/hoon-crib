## `$?` "bucwut"

Form a type from a union of other types.

#### Syntax

Variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $?  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  $?(p1 p2 p3 pn)
  ```

---

- Irregular
- ```hoon
    ?(p1 p2 p3 pn)
  ```
{% /table %}

#### AST

```hoon
[%bcwt p=(list spec)]
```

#### Normalizes to

The last item in `p` which normalizes the sample to itself.

Void, if `p` is empty.

#### Defaults to

The last item in `p`.

#### Discussion

For a union of atoms, a `$?` is fine. For more complex nouns, always try to use
a [`$%`](#-buccen), [`$@`](#-bucpat) or [`$^`](#-bucket), at least if you expect
your structure to be used as a normalizer.

#### Examples

```
> =a ?(%foo %baz %baz)

> (a %baz)
%baz

> (a [37 45])
ford: %ride failed to execute:

> $:a
%baz
```
