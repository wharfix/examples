{ pkgs }: 
let
  hugepkg = pkgs.runCommand "hugepkg" {} ''
    mkdir -p $out/bin;
    dd if=/dev/urandom of=$out/bin/hugefile bs=1M count=8096
  '';
in
  {
    name = "hugepkg";
    contents = with pkgs; [
      hugepkg
      coreutils
    ];
    config.entryPoint = [
    (pkgs.writeShellScript "nop" ''
      ls -lh ${hugepkg}/bin/hugefile;
    '')
    ];
  }
