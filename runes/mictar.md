## `;*` "mictar"

make a list of XML nodes from complex Hoon expression (Sail)

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ;*  p
  ```

---

- Wide
- ```hoon
  ;*(p)
  ```

---

- Irregular
- None.
{% /table %}

`p` is a Hoon expression that produces a `marl`.

#### Produces

A [`marl`](/reference/hoon/stdlib/5e#marl), i.e., a list of
[`manx`](/reference/hoon/stdlib/5e#manx). A `manx` is a noun that
represents a single XML node.

#### Discussion

`;*` is a Sail rune. Sail is a part of Hoon used for creating and operating on
nouns that represent XML nodes. With the appropriate rendering pipeline, a Sail
document can be used to generate a static website.

If you need a complex Hoon expression to produce a `marl`, use the `;*` rune.
Often this rune is used with an expression, `p`, that includes one or more `;=`
subexpressions.

(See also [`;=`](#-mictis).)

#### Examples

```
> ;*  ?:  (gth 3 2)
        ;=  ;p: This is node 1 of 'yes'.
            ;p: This is node 2 of 'yes'.
        ==
      ;=  ;p: This is node 1 of 'no'.
          ;p: This is node 2 of 'no'.
      ==
[ [[%p ~] [[%$ [%$ "This is node 1 of 'yes'."] ~] ~] ~]
  [[[%p ~] [[%$ [%$ "This is node 2 of 'yes'."] ~] ~] ~] ~]
]

> ;*  ?:  (gth 2 3)
          ;=  ;p: This is node 1 of 'yes'.
              ;p: This is node 2 of 'yes'.
          ==
        ;=  ;p: This is node 1 of 'no'.
            ;p: This is node 2 of 'no'.
        ==
[ [[%p ~] [[%$ [%$ "This is node 1 of 'no'."] ~] ~] ~]
  [[[%p ~] [[%$ [%$ "This is node 2 of 'no'."] ~] ~] ~] ~]
]
```

---

