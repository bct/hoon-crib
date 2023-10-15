## `|?` "barwut"

Produce a lead trap.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  |?  a
  ```

---

- Wide
- ```hoon
  |?(a)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%brwt p=hoon]
```

#### Expands to

```hoon
^?  |.  a
```

#### Semantics

A `|?` expression produces a lead trap (i.e., a lead core with one arm named
`$`). `a` is a Hoon expression that defines what the `$` arm does.

#### Discussion

See this [discussion of the core variance model](/reference/hoon/advanced).

#### Examples

```
> =>  ~  ^+  |?(%a)  |.(%a)
<1?pqz $~>

> =>  ~  ^+  |?(%a)  |.(%b)
nest-fail
```
