## `;<` "micgal"

Monadic do notation.

#### Syntax

Four arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;<  mold  bind  expr1  expr2
  ```

---

- Wide
- ```hoon
  ;<(mold bind expr1 expr2)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%mcgl p=spec q=hoon r=hoon s=hoon]
```

#### Semantics

A `;<` is for sequencing two computations, `expr1` and `expr2`, using a provided
implementation of monadic bind. This rune takes a gate `bind` which takes a mold
`mold` and produces an implementation of monadic bind.

#### Desugaring

```hoon
%+  (bind mold)
  expr1
|=  mold
expr2
```

#### Discussion

`;<` is much like Haskell `do` notation. You have a sequence of events you'd
like to run such that each past the first depends on the output of the previous
one. The output of the previous one may not be of the correct type to use as an
input to the next one, and so an adapter such as `+biff` is needed.

`;<` differs from [`;~`](#-micsig) in that it takes a gate which takes a mold
that produces an implementation of monadic bind, rather than taking an
implementation of monadic bind directly.

`;<` can be used to glue a pipeline together to run an asynchronous function or
event. This can be helpful when deferring parts of a computation based on
external data.

We remark that you can switch binds in the middle of a sequence of `;<`.

#### Examples

[`+biff`](/reference/hoon/stdlib/2a/#biff) is the unit monad's
implementation of monadic bind. That is to say, it takes a unit `a` and a gate
`b` that accepts a noun that produces a unit, and extracts the value from `a` to
pass as a sample to `b`.

We illustrate the usage of `;<` with `+biff` with a `map` of atoms:

```
> =m (my ~[[1 3] [2 2] [3 1]])
> (~(get by m) 1)
[~ 3]
```

A single usage of `;<` only serves to apply the binding function to the output
of `expr1`:

```
> ;<  a=@  _biff  (~(get by m) 1)
  a
3
```

Here we see the result of chaining them together:

```
> ;<  a=@  _biff  (~(get by m) 1)
  ;<  b=@  _biff  (~(get by m) a)
  b
1
```

---

