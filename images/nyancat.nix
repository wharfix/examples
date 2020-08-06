{ pkgs }: {
  name = "nyancat";
  config.EntryPoint = [ "${pkgs.nyancat}/bin/nyancat" ];
}
