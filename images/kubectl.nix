{ pkgs }: {
  name = "kubectl";
  config.EntryPoint = [ "${pkgs.kubectl}/bin/kubectl" ];
}
