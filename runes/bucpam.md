## `$&` "bucpam"

Repair a value of a tagged union type.

#### Syntax

Two arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  $&  p
  q
  ```

---

- Wide
- ```hoon
  $&(p q)
  ```

---

- Irregular
- None.
{% /table %}

```hoon
$&(combined-mold=spec normalizing-gate=hoon)
```

Here `combined-mold` is a tagged union type (typically made with `$%`) and
`normalizing-gate` is a gate which accepts values of `combined-mold` and
normalizes them to be of one particular type in `combined-mold`.

#### AST

```hoon
[%bcpm p=spec q=hoon]
```

#### Normalizes to

The product of the normalizing gate and sample.

#### Defaults to

The default of the last type listed in `p`, normalized with the normalizing gate.

#### Discussion

This rune is used to "upgrade" or "repair" values of a structure, typically from
an old version to a new version. For example, this may happen when migrating
state after updating an app.

#### Examples

```hoon
+$  old  [%0 @]
+$  new  [%1 ^]
+$  combined  $%(old new)
+$  adapting  $&(combined |=(?-(-.a %0 [%1 1 +.a], %1 a)))
```

Here `adapting` is a structure that bunts to `[%1 ^]` but also normalizes from
`[%0 @]` if called on such a noun.

---

