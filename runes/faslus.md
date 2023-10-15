## `/+` "faslus"

Import libraries from `/lib`.

#### Syntax

```hoon
/+  foo, bar, baz
```

Note there is only a single space between each item.

#### Semantics

Names correspond to files in the `/lib` directory of the same desk as this file,
e.g. `/lib/foo.hoon` for `foo`. Names containing hyphens, e.g. `foo-abc`, will
first resolve to `/lib/foo-abc.hoon`, and if that doesn't exist, it will try
`/lib/foo/abc.hoon`.

Imports may be given a different face by doing `xyz=foo`. Imports may have their
face stripped (so you can directly reference their wings) with `*foo`.

---

