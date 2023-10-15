## `+$` "lusbuc"

Produce a structure arm (type definition).

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  +$  p=term  q=spec
  ```

---

- Wide
- None.

---

- Irregular
- None.
{% /table %}

`p` is an arm name, and `q` is any structure expression.

#### Discussion

Arms produced by `+$` are essentially type definitions. They should be used when one wants to define custom types using core arms.

The Hoon subexpression, `q`, must be a structure expression. That is, it must be
either a basic structure expression (`*`, `~`, `^`, `?`, and `@`), or a complex
expression made with the `$` family of runes (including irregular variants).
Names of structures are also permitted (e.g., `tape`).

#### Examples

```
> =c |%
       +$  atom-pair  $:(@ @)
       +$  flag-atom  $:(? @)
     --

> `atom-pair.c`[12 14]
[12 14]

> `atom-pair.c`[12 [22 33]]
nest-fail

> `flag-atom.c`[& 22]
[%.y 22]
```

---

