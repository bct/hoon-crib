## `/%` "fascen"

Build and import a mark core.

#### Syntax

Two arguments.

```hoon
/%  some-face  %some-mark
```

#### Semantics

The first argument is a face to pin the mark core with. The second argument is a
mark.

The static mark core (a `nave:clay`) for the specified mark (which resides in
the same desk as the file) is built and pinned to the subject with the specified
face.

#### Examples

To build the mark core for the `%txt` mark:

```hoon
/%  foo  %txt
```

Its arms can then be accessed like:

```
> form:foo
%txt-diff
```
