{ stdenv
, texlive
, lib
}:

with lib;

stdenv.mkDerivation {
  name = "curriculum-vitae";
  buildInputs = [ texlive.combined.scheme-full ];
  src = cleanSource ./.;
  installPhase = ''
    mkdir -p $out
    export pdf=$out/curriculum-vitae-${texlive.combined.scheme-full.name}.pdf
    cp curriculum-vitae.pdf $pdf
  '';
}
