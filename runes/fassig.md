## `/~` "fassig"

Import, build, evaluate and pin the results of many hoon files in a directory.

#### Syntax

Three arguments.

```hoon
/~  some-face  some-type  /some/directory
```

#### Semantics

The first argument is the face to pin the results with. The second argument is
the type each hoon file produces when evaluated. The third argument is the path
to a directory in the same desk as this file, containing `%hoon` files.

Each hoon file in the specified directory will be built and evalutated. The
result of evaluating each file will be added to a
[`++map`](/reference/hoon/stdlib/2o#map) and pinned with the specified face
(`some-face`). The keys of the map will be the name of each file, and the values
of the map will be the result of evaluating each file and casting its result to
the type specified (`some-type`).

All of the hoon files in the specified directory, when evaluated, must produce
data of a type that nests under the type specified (`some-type`). File with a
mark other than `%hoon` will be ignored.

The type of the map will be `(map knot some-type)`.

#### Examples

If the `/foo/bar` directory contains three files:

- `x.hoon` containing `(silt ~[1 2 3 4 5])`
- `y.hoon` containing `(silt ~[99 100])`
- `z.hoon` containing `(silt ~[22 33 44])`

Then the following `/~` expression:

```hoon
/~  foo  (set @ud)  /foo/bar
```

...will pin a `(map knot (set @ud))` with a face of `foo` which contains:

```
{[p=~.y q={100 99}] [p=~.z q={22 33 44}] [p=~.x q={5 1 2 3 4}]}
```

---

