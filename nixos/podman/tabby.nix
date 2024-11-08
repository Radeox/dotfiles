{ ... }: {
  virtualisation.oci-containers.containers = {
    tabby = {
      image = "tabbyml/tabby";
      autoStart = true;
      ports = [ "127.0.0.1:10001:8080" ];
      extraOptions = [ "--gpus=all" ];

      volumes = [
        "/etc/tabby:/data"
      ];

      cmd = [
        "serve"
        "--model=StarCoder2-3B"
        "--chat-model=Qwen2.5-Coder-1.5B"
        "--device=cuda"
      ];
    };
  };
}
