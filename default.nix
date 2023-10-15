{ stdenv }:

stdenv.mkDerivation {
  name = "hoon-crib";
  src = ./.;

  buildPhase = ''
    cat prelude.rb > hoon-crib

    runes=( $(basename -s .md $(ls runes)) )
    heredocs=""
    for rune in ''${runes[@]}; do
      heredocs="$heredocs '$rune' => <<end$rune,"
    done
    heredocs="$heredocs nil => 'usage: hoon-crib RUNE'"

    echo "puts_rune_documentation(ARGV[0], {$heredocs})" >> hoon-crib

    for rune in ''${runes[@]}; do
      cat runes/$rune.md >> hoon-crib
      echo "end$rune" >> hoon-crib
    done

    chmod +x hoon-crib
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hoon-crib $out/bin/
  '';
}
