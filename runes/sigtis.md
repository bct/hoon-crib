## `~=` "sigtis"

Detect duplicate.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~=  p
  q
  ```

---

- Wide
- ```hoon
  ~=(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgts p=hoon q=hoon]
```

#### Expands to

`q`.

#### Convention

If `p` equals `q`, produce `p` instead of `q`.

#### Discussion

Duplicate nouns are especially bad news in Hoon, because comparing them
takes O(n) time. Use `~=` to avoid this inefficiency.

#### Examples

This code traverses a tree and replaces all instances of `32` with
`320`:

```
> =foo |=  a=(tree)
       ?~(a ~ ~=(a [?:(=(n.a 32) 320 n.a) $(a l.a) $(a r.a)]))

> (foo 32 ~ ~)
[320 ~ ~]
```

Without `~=`, it would build a copy of a completely unchanged tree. Sad!

---

