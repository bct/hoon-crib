## `;~` "micsig"

Glue a pipeline together with a product-sample adapter.

#### Syntax

One fixed argument, then a variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;~  p
    q1
    q2
    qn
  ==
  ```

---

- Wide
- ```hoon
  ;~(p q1 q2 qn)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%mcsg p=hoon q=(list hoon)]
```

#### Produces

The gates in `q` are composed together using the gate `p` as an intermediate
function, which transforms a `q` product and a `q` gate into a `q` sample.

#### Expands to

**Note: these are structurally correct, but elide some type-system complexity.**

`;~(a b)` reduces to `b`.

`;~(a b c)` expands to

```hoon
|=  arg=*
(a (b arg) c(+6 arg))
```

`;~(a b c d)` expands to

```hoon
|=  arg=*
%+  a (b arg)
=+  arg=arg
|.  (a (c arg) d(+6 arg))
```

#### Desugaring

```hoon
?~  q  !!
|-
?~  t.q  i.q
=/  a  $(q t.q)
=/  b  i.q
=/  c  ,.+6.b
|.  (p (b c) a(,.+6 c))
```

#### Discussion

Apparently `;~` is a "Kleisli arrow." It's also a close cousin of the infamous
"monad." Don't let that bother you. Hoon doesn't know anything about category
theory, so you don't need to either.

`;~` is often used in parsers, but is not only for parsers.

This can be thought of as user-defined function composition; instead of simply
nesting the gates in `q`, each is passed individually to `p` with the product
of the previous gate, allowing arbitrary filtering, transformation, or
conditional application.

#### Examples

A simple "parser." `trip` converts a `cord` (atomic string) to
a `tape` (linked string).

```
> =cmp |=([a=tape b=$-(char tape)] `tape`?~(a ~ (weld (b i.a) t.a)))
> ;~(cmp trip)
<1.zje {a/@ <409.yxa 110.lxv 1.ztu $151>}>
```

With just one gate in the pipeline `q`, the glue `p` is unused:

```
> (;~(cmp trip) 'a')
"a"
```

But for multiple gates, we need it to connect the pipeline:

```
> (;~(cmp trip |=(a=@ ~[a a])) 'a')
"aa"

> (;~(cmp trip |=(a=@ ~[a a])) '')
""
```

A more complicated example:

```
> (;~(cmp trip ;~(cmp |=(a=@ ~[a a]) |=(a=@ <(dec a)>))) 'b')
"97b"

> (;~(cmp trip |=(a=@ ~[a a]) |=(a=@ <(dec a)>)) 'b')
"97b"

> (;~(cmp trip |=(a=@ ~[a a]) |=(a=@ <(dec a)>)) '')
""

> (;~(cmp trip |=(a=@ ~[a a]) |=(a=@ <(dec a)>)) 'a')
"96a"

> (;~(cmp trip |=(a=@ ~[a a]) |=(a=@ <(dec a)>)) 'acd')
"96acd"
```

---

