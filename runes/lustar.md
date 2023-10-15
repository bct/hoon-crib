## `+*` "lustar"

Defines deferred expressions within doors.

#### Syntax

Arguments: A variable number of pairs.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  +*  a=term  b=hoon
      c=term  d=hoon
      ...
      e=term  f=hoon
  ```

---

- Wide
- None.

---

- Irregular
- None.
{% /table %}

`a`, `c`, `e` are arm names and `b`, `d`, `f` are any Hoon expression. Note that
unlike all other runes with a variable number of arguments, the list of
arguments of `+*` does not end with a terminator.

`+*` arms must always come at the beginning of the battery, before any other
type of lus arm.

#### Discussion

The primary use of `+*` is to create deferred expressions within doors (see
Examples below). This is a name for an expressions that will be evaluated in
each place the name is dereferenced. This is a similar concept to aliases or
macros, but there are some subtle but important differences. Deferred
expressions given by `+*` do not count towards the number of arms in the door
and thus are also called "virtual arms", which can be important for things like
Gall agent cores that require a fixed number of arms.

Under the hood, `+*` gets compiled as
[`=*`'s](/reference/hoon/rune/tis#-tistar) (see here for more discussion on
deferred expressions). `+* foo bar` rewrites each `++` arm beneath it in the
core to include `=* foo bar`. For example, the interpreter sees the Nock
compiled from this Hoon expression

```hoon
|_  z=@ud
+*  n  1
++  x  (add z n)
++  y  (sub z n)
--
```

as being identical the Nock compiled from this one:

```hoon
=|  z=@ud
|%
++  x
  =*  n  1
  (add z n)
++  y
  =*  n  1
  (sub z n)
--
```

#### Examples

To assign an alias to a door, we often write the following.

```hoon
|_  foo
+*  this  .
```

This is the idomatic way to assign the alias `this` to the door.

Sometimes cores, such as Gall app cores, have a fixed number of arms, but you'd
like to include more. This is where aliases employed as "virtual arms" may be of
use. We note that it is often better style to compose cores with `=>` or `=<` to add more arms to a
Gall app core. This usage of `+*` is controversial and should be minimized.

```hoon
|_  =bowl:gall
+*  this  .
    samp  +<
    cont  +>
```

This assigns the door the alias `this`, the sample of the door `samp`, and the
context of the door `cont`.

You may also call functions with `+*` by making use of e.g. the `%~` rune.

```hoon
=<
  |_  a=@
  +*  do   ~(. +> a)
  ++  stuff  foo:do
::etc
--
|_  b=@
++  foo  %bar
::etc
--
```
