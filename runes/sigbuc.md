## `~$` "sigbuc"

Profiling hit counter.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~&  p
  q
  ```

---

- Wide
- ```hoon
  ~&(p q)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgbc p=term q=hoon]
```

#### Expands to

`q`.

#### Discussion

If profiling is on, adds 1 to the hit counter `p`, which is a `term` like
`%foo`. Profiling is enabled by passing the `-P` flag to the `urbit` binary.
Profiling results are saved in `/path/to/pier/.urb/put/profile/~some.date.txt`.

#### Examples

```
> ~$(%foo 3)
3
```

Assuming we have the binary running with the `-P` flag, if we do this:

```
> =z |=  a=@
     ?:  =(a 0)
       a
     ~$  %my-hit-counter
     $(a (dec a))

> (z 42)
0
```

...then look in `/path/to/pier/.urb/put/profile/~some.date.txt`, we'll see this
line near the top of the file:

```
my-hit-counter: 42
```

---

