## `;+` "miclus"

make a single XML node (Sail)

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;+  p
  ```

---

- Wide
- ```hoon
  ;+(p)
  ```

---

- Irregular
- None.
{% /table %}

`p` is a Hoon expression that produces a `manx`.

#### Produces

A [`marl`](/reference/hoon/stdlib/5e#marl), i.e., a list of
[`manx`](/reference/hoon/stdlib/5e#manx). A `manx` is a noun that
represents a single XML node.

#### Discussion

tl;dr -- `;+` converts a `manx` to a `marl`.

`;+` is a Sail rune. Sail is a part of Hoon used for creating and operating on
nouns that represent XML nodes. With the appropriate rendering pipeline, a Sail
document can be used to generate a static website.

In Sail a single XML node is represented by a `manx`. A single
<code><p&gt;</code> node `manx` can be produced in the following way:

```
> ;p: This will be rendered as an XML node.
[[%p ~] [[%$ [%$ "This will be rendered as an XML node."] ~] ~] ~]
```

Sometimes what is needed is a `marl`, i.e., a list of `manx`. To convert a
single `manx` to a `marl`, use the `;+` rune.

One interesting thing about Sail is that it allows you to use complex Hoon
expressions to choose from among several nodes to render. The `;+` rune can take
such a complex expression.

#### Examples

```
> ^-  marl
  ;+  ?:  (gth 3 2)
        ;p: This is the node for 'yes'.
      ;p: This is the node for 'no'.
~[
  [ g=[n=%p a=~]
    c=[i=[g=[n=%$ a=~[[n=%$ v="This is the node for 'yes'."]]] c=~] t=~]
  ]
]

> ^-  marl
  ;+  ?:  (gth 2 3)
        ;p: This is the node for 'yes'.
      ;p: This is the node for 'no'.
~[
  [ g=[n=%p a=~]
    c=[i=[g=[n=%$ a=~[[n=%$ v="This is the node for 'no'."]]] c=~] t=~]
  ]
]
```

---

