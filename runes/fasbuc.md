## `/$` "fasbuc"

Import mark conversion gate.

#### Syntax

Three arguments.

```hoon
/$  some-face   %from-mark   %to-mark
```

#### Semantics

The first argument is the face to pin it as. The second argument is the mark to
convert _from_. The third argument is the mark to convert _to_.

The result will be a gate of `$-(type-1 type-2)`, pinned with the specified
face. The types are the data types of the _from_ mark and _to_ mark,
respectively.

The mark conversion gate will be built from marks in `/mar` on the same desk as
this file.

#### Examples

To build a mark conversion gate from `%txt` to `%mime`, you would do:

```hoon
/$  txt-to-mime  %txt  %mime
```

`txt-to-mime` would be a gate of `$-(wain mime)`. You could then call the gate
like:

```
> (txt-to-mime ~['first line' 'second line'])
[p=/text/plain q=[p=22 q=37.949.953.370.267.411.298.483.129.707.945.775.026.849.432.323.909.990]]
```

---

