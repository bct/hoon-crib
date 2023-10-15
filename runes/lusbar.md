## `+|` "lusbar"

Chapter label (not useful)

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  +|  %label
  ```

---

- Wide
- None.

---

- Irregular
- None.
{% /table %}

#### Discussion

The `+|` doesn't produce an arm. It instead provides a label for the arms that
follow it. The arms of a core can be divided into **chapters** for
'organization'. Chapter labels aren't part of the underlying noun of the core;
they're stored as type system metadata only.

See [`tome`](/reference/hoon/stdlib/4o#tome) in the Hoon standard library.

**Note:** The `+|` rune has little practical utility. Chapter labels cannot be
referenced short of manually processing the `$type` of a core.

#### Examples

Let's look at what the Hoon compiler's parser, `ream`, does with the `+|` rune:

```
> (ream '|%  +|  %numbers  ++  two  2  ++  three  3  --')
[ %brcn
  p=~
    q
  { [ p=%numbers
      q=[p=~ q={[p=%three q=[%sand p=%ud q=3]] [p=%two q=[%sand p=%ud q=2]]}]
    ]
  }
]
```

Notice that `p.q` has the label `%numbers`. Contrast with:

```
> (ream '|%  ++  two  2  ++  three  3  --')
[ %brcn
  p=~
    q
  { [ p=%$
      q=[p=~ q={[p=%three q=[%sand p=%ud q=3]] [p=%two q=[%sand p=%ud q=2]]}]
    ]
  }
]
```

---

