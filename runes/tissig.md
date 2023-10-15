## `=~` "tissig"

Compose many expressions.

#### Syntax

Variable number of arguments.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =~  p1
      p2
      p3
      pn
  ==
  ```

---

- Wide
- ```hoon
  =~(p1 p2 p3 pn)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tssg p=(list hoon)]
```

#### Produces

The product of the chain composition.

#### Examples

```
> =~  10
      [20 .]
      [30 .]
      [40 .]
      .
  ==
[40 30 20 10]

> =~  [sub (mul 3 20) (add 10 20)]
      (sub +)
      +(.)
  ==
31

> =foo =|  n=@
       =<  =~  increment
               increment
               increment
               n
           ==
       |%
       ++  increment
         ..increment(n +(n))
       --
> foo
3
```

---

## `=*` "tistar" {% #-tistar %}

Define a deferred expression.

#### Syntax

Three arguments, fixed.

{% table %}

- Form
- Syntax

---

- Tall
- ```hoon
  =*  p
    q
  r
  ```

---

- Wide
- ```hoon
  =*(p q r)
  ```

---

- Irregular
- None.
{% /table %}

#### AST

```hoon
[%tstr p=term q=hoon r=hoon]
```

#### Produces

`r`, compiled with a subject in which `p` is a deferred expression for `q`.

#### Discussion

`=*` assigns a name to an expression that will be evaluated in each place the
name is dereferenced. This allows you to "write" through it to the original
subject `axis`. `q` is recorded in the type information of `p`, and `q` is
calculated every time you use `p`.

This rune has some similarities with macros, and some similarities with aliases,
but it is not really either.

This rune is commonly used to give a Gall agent's state the name `state` like:

```hoon
=*  state  -
```

This lets you reference the whole `state` while also being able to reference its
individual elements like `foo` and `bar`, without having to do `foo.state`,
`bar.state`, etc.

#### Examples

```
> =+  a=1
  =*  b  a
  [a b]
[1 1]

> =+  a=1
  =*  b  a
  =.  a  2
  [a b]
[2 2]
```

---

