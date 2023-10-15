## `/-` "fashep"

Import structure libraries from `/sur`.

#### Syntax

```hoon
/-  foo, bar, baz
```

Note there is only a single space between each item.

#### Semantics

Names correspond to files in the `/sur` directory of the same desk as this file, e.g.
`/sur/foo.hoon` for `foo`. Names containing hyphens, e.g. `foo-abc`, will first
resolve to `/sur/foo-abc.hoon`, and if that doesn't exist, it will try
`/sur/foo/abc.hoon`.

Imports may be given a different face by doing `xyz=foo`. Imports may have their
face stripped (so you can directly reference their wings) with `*foo`.

---

