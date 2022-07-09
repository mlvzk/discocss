{ stdenvNoCC
, fetchFromGitHub
, lib
, makeWrapper
, runCommand
, discord
, discordAlias ? false
}:
let
  unwrapped = stdenvNoCC.mkDerivation rec {
    name = "discocss";

    src = fetchFromGitHub {
      owner = "mlvzk";
      repo = "discocss";
      rev = "env";
      sha256 = "sha256-9cGz1+c2Mm+odiYNcgYlb1rpjXL3eIdFnREz3jvkiGg=";
    };

    installPhase = ''
      install -Dm755 -t $out/bin $src/discocss
    '';
  };
in
runCommand "discocss"
{
  buildInputs = [ makeWrapper ];
  preferLocalBuild = true;
} ''
  mkdir -p $out/{bin,share}

  ${lib.optionalString discordAlias ''
    ln -s $out/bin/discocss $out/bin/Discord

    ln -s ${discord}/share/* $out/share/
  ''}


  makeWrapper ${unwrapped}/bin/discocss $out/bin/discocss \
    --set DISCOCSS_DISCORD_BIN ${discord}/bin/Discord
''
