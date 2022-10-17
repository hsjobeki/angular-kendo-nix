{ stdenv
, gitignoreSource
, package
, nodejs
, nodeDependencies
}:
stdenv.mkDerivation {
  src = gitignoreSource ../.;
  inherit (package) name;
  buildInputs = [ nodejs ];

  configurePhase = ''
    ln -s ${nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"
  '';

  buildPhase = ''
    npm run build
  '';

  installPhase = ''
    cp -r ./dist/ $out/
  '';
}
