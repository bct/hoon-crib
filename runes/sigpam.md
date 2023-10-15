## `~&` "sigpam"

Debugging printf.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~&  p
  q
  ```

---

- Wide
- ```hoon
  ~&(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgpm p=hoon q=hoon]
```

#### Expands to

`q`.

#### Product

Pretty-prints `p` on the console before computing `q`.

#### Discussion

This rune has no semantic effect beyond the Hoon expression `q`. It's used
solely to create a side-effect: printing the value of `p` to the console.

It's most useful for debugging programs.

#### Examples

```
> ~&('halp' ~)
'halp'
~

> ~&  'halp'
  ~
'halp'
~
```

---

