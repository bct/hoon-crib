## `/*` "fastar"

Import the file at the specified path as the specified mark.

#### Syntax

Three arguments.

```hoon
/*  some-face  %as-mark  /path/to/file
```

#### Semantics

The first argument is the face to pin it as. The second argument is the mark it
should be converted to. The third argument is the path to the file in the same
desk as this file, with the trailing mark included.

The mark specified may be different to the mark of the file, as long as
conversion is possible. Note that a `%hoon` file will not be built like with
`/=`: the type of a `%hoon` file is a `@t` so that is what will be pinned.

#### Examples

To import `/foo/bar.hoon` you would do:

```hoon
/*  foobar  %hoon  /foo/bar/hoon
```

`foobar` would then be an `@t` of the contents of that file.

---

