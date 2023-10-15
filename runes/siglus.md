## `~+` "siglus"

Cache a computation.

#### Syntax

One argument, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  ~+  p
  ```

---

- Wide
- ```hoon
  ~+(p)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%sgls p=hoon]
```

#### Expands to

`p`.

#### Convention

Caches the formula and subject of `p` in a local cache (generally
transient in the current event).

#### Examples

This may pause for a second:

```
> %.(25 |=(a=@ ?:((lth a 2) 1 (add $(a (sub a 2)) $(a (dec a))))))
121.393
```

This may make you want to press `ctrl-c`:

```
> %.(30 |=(a=@ ?:((lth a 2) 1 (add $(a (sub a 2)) $(a (dec a))))))
1.346.269
```

This should work fine:

```
> %.(100 |=(a=@ ~+(?:((lth a 2) 1 (add $(a (sub a 2)) $(a (dec a)))))))
573.147.844.013.817.084.101
```

---

