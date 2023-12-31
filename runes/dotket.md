## `.^` "dotket"

Load from the Arvo namespace (scry) with a fake Nock instruction: Nock 12.

#### Syntax

Two arguments, with the second optionally split into an arbitrary number of
elements.

While this rune technically takes a fixed number of arguments, `q` is usually
split into at least two parts, and the tall form of this rune must be terminated
with a `==`. Note also that the `==` does not make the arguments into a list as
you might expect, so `q` must be explicitly null-terminated if its elements are
specified separately.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  .^  p
    q1
    q2
    q3
    qn
  ==
  ```

---

- Wide
- ```hoon
  .^(p q1 q2)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%dtkt p=spec q=hoon]
```

#### Produces

The noun `q`, cast to the type `p`.

#### Discussion

Nock has no `12` instruction! But the virtual Nock
used to run userspace code does. Nock `12` loads from a
typed immutable namespace defined by its virtual context.

Ordinarily a Hoon expression has access to no information but whatever can be found in the subject. The one exception is with the `.^` rune. It essentially allows you to request information from one of the Arvo vanes (modules).

`.^` checks that the type of the value retrieved from Arvo nests under `p`. `q` is a `path` which includes information about which vane is being queried, and what sort of information is requested.

In principle `.^` takes two subexpressions, but in practice `q` is often given in two parts: the first part includes the vane to be queried (e.g., `%a` for Ames, `%b` for Behn, `%c` for Clay, etc.) and the kind of request. The second part is a path that corresponds to the kind of request.

#### Examples

In the dojo we can ask Clay -- the Arvo filesystem -- for a listing of the files at our current path, `%`:

```
> .^(arch %cy %)
[ fil=~
    dir
  { [p=~.app q=~]
    [p=~.sur q=~]
    [p=~.gen q=~]
    [p=~.lib q=~]
    [p=~.mar q=~]
    [p=~.ted q=~]
    [p=~.desk q=~]
    [p=~.sys q=~]
  }
]
```

The `%c` is for Clay, and the `y` is for the request type. `arch` is the type of the listing. See `gen/cat.hoon` to see how this information is printed more prettily.

The `%` is for the current path in the dojo:

```
> `path`%
/~zod/base/~2018.9.20..23.05.35..0231
```

You can modify the time of the file listing quite simply and ask for a listing from 5 hours ago. (Remember that Clay is a revision-controlled file system.)

```
> .^(arch %cy /(scot %p our)/base/(scot %da (sub now ~h5)))
[ fil=~
    dir
  { [p=~.app q=~]
    [p=~.sur q=~]
    [p=~.gen q=~]
    [p=~.lib q=~]
    [p=~.mar q=~]
    [p=~.ted q=~]
    [p=~.desk q=~]
    [p=~.sys q=~]
  }
]
```

`our` is the value for your ship's name.

---

