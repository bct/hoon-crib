## `?=` "wuttis"

Test pattern match.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ?=  p
  q
  ```

---

- Wide
- ```hoon
  ?=(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%wtts p=spec q=wing]
```

#### Produces

`%.y` (true) if the noun at `q` is in the type of `p`; `%.n` (false) otherwise.

#### Discussion

`?=` is not as powerful as it might seem. For instance, it
can't generate a loop -- you cannot (and should not) use it to
test whether a `*` is a `(list @)`. Nor can it validate atomic
auras.

Patterns should be as weak as possible. Unpack one layer of
union at a time. Don't confirm things the type system knows.

For example, when matching from a tagged union for the type `[%foo p=@ q=[@ @]]`, the appropriate pattern is `[%foo *]`. You have one
question, which is whether the head of the noun is `%foo`.

A common error is `find.$`, meaning `p` is not a type.

#### Examples

```
> =bar [%foo %bar %baz]
> ?=([%foo *] bar)
%.y
```

---

