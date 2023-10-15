Dumps the documentation for a hoon rune to the console

Example:

    $ hoon-crib '~&'
    ## `~&` "sigpam"

    Debugging printf.

    #### Syntax

    Two arguments, fixed.
    ...

To update rune documentation:

    nix flake update
    nix run .#dump-runes
