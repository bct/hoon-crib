## `;=` "mictis"

make a list of XML nodes (Sail)

#### Syntax

A variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;=  p1
      p2
      p3
     pn
  ==
  ```

---

- Wide
- ```hoon
  ;=(p1 p2 p3 pn)
  ```

---

- Irregular
- None.
{% /table %}

`p1`-`pn` are Hoon expressions, each of which poduces a `manx`.

#### Produces

A [`marl`](/reference/hoon/stdlib/5e#marl), i.e., a list of
[`manx`](/reference/hoon/stdlib/5e#manx). A `manx` is a noun that
represents a single XML node.

#### Discussion

`;=` is a [Sail](/guides/additional/sail) rune. Sail is a part of Hoon used for
creating and operating on nouns that represent XML nodes. With the appropriate
rendering pipeline, a Sail document can be used to generate a static website.

In Sail a single XML node is represented by a `manx`. A single `<p>` node `manx`
can be produced in the following way:

```
> ;p: This will be rendered as an XML node.
[[%p ~] [[%$ [%$ "This will be rendered as an XML node."] ~] ~] ~]
```

Sometimes what is needed is a `marl`, i.e., a list of `manx`. To convert a
series of `manx` nodes to a `marl`, use the `;=` rune.

(See also [`;*`](#-mictar).)

#### Examples

```
> ;=  ;p: This is the first node.
      ;p: This is the second.
      ;p: Here is the last one.
  ==
[ [[%p ~] [[%$ [%$ "This is the first node."] ~] ~] ~]
  [[%p ~] [[%$ [%$ "This is the second."] ~] ~] ~]
  [[%p ~] [[%$ [%$ "Here is the last one."] ~] ~] ~]
  ~
]
```
