## `$%` "buccen"

Structure which recognizes a union tagged by head atom.

#### Syntax

A variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $%  [%p1 ...]
      [%p2 ...]
      [%p3 ...]
      [%pn ...]
  ==
  ```

---

- Wide
- ```hoon
  $%([%p1 ...] [%p2 ...] [%p3 ...] [%pn ...])
  ```

---

- Irregular
- None.
{% /table %}

Each item may be an atom or (more commonly) a cell. The atom or head of the cell
_must_ be a constant (`%foo`, `%1`, `%.y`, etc).

#### AST

```hoon
[%bccn p=(list spec)]
```

#### Defaults to

The default of the last item `i` in `p`. Crashes if `p` is empty.

#### Discussion

A `$%` is a tagged union, a common data model.

Make sure the last item in your `$%` terminates, or the default will
be an infinite loop! Alteratively, you can use `$~` to define a custom
type default value.

#### Examples

```
> =foo $%([%foo p=@ud q=@ud] [%baz p=@ud])

> (foo [%foo 4 2])
[%foo p=4 q=2]

> (foo [%baz 37])
[%baz p=37]

> $:foo
[%baz p=0]
```

---

