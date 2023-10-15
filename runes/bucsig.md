## `$~` "bucsig"

Define a custom type default value.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $~  p
  q
  ```

---

- Wide
- ```hoon
  $~(p q)
  ```

---

- Irregular
- None.
{% /table %}

`p` defines the default value, and `q` defines everything else about the
structure.

#### AST

```hoon
[%bcsg p=hoon q=spec]
```

#### Product

Creates a structure (custom type) just like `q`, except its default value is `p`.

#### Defaults to

The product of `p`.

#### Discussion

You should make sure that the product type of `p` nests under `q`. You can check
the default value of some structure (custom type) `r` with `*r`. (See the [`^*`
rune](/reference/hoon/rune/ket#-kettar).)

Do not confuse the `$~` rune with the constant type for null, `$~`. (The latter
uses older Hoon syntax that is still accepted. Preferably it would be `%~`.)

#### Examples

First, let's define a type without using `$~`:

```
> =b $@(@tas $%([%two *] [%three *]))

> `b`%hello
%hello

> `b`[%two %hello]
[%two 478.560.413.032]

> *b

%$

> *@tas
%$
```

Using `$~`:

```
> =c $~(%default-value $@(@tas $%([%two *] [%three *])))

> `c`%hello
%hello

> `c`[%two %hello]
[%two 478.560.413.032]

> *c
%default-value
```

---

