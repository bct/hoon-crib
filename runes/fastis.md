## `/=` "fastis"

Build and import a hoon file at the specified path.

#### Syntax

Two arguments.

```hoon
/=  some-face  /path/to/file
```

#### Semantics

This lets you build and import a hoon file from anywhere in the desk.

The first argument is the face to pin it as. The second argument is the path to
the file in the same desk as this file. The file must be a `%hoon` file, and the
trailing mark (`hoon`) must be omitted from the path.

#### Examples

To build and import `/foo/bar.hoon` you would do:

```hoon
/=  foobar  /foo/bar
```

---

