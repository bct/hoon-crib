## `!>` "zapgar"

Wrap a noun in its type (form a [`vase`](/reference/hoon/stdlib/4o#vase)).

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  !>  p
  ```

---

- Wide
- ```hoon
  !>(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%zpgr p=hoon]
```

#### Produces

A cell whose tail is the product of `p`, and whose head is the static type of `p`.

#### Discussion

In Hoon, a dynamic type is a static type compiled at runtime. This type-noun
cell is generally called a [`vase`](/reference/hoon/stdlib/4o#vase).

#### Examples

```
> !>(1)
[#t/@ud q=1]
```

If you want just the type value, use a 'type spear'. This is `-:!>`, i.e., the
head of the cell produced by `!>`:

```
> -:!>(1)
#t/@ud
```

---

