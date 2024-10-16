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
        # "--model=DeepseekCoder-1.3B"
        "--model=StarCoder-3B"
        "--chat-model=Qwen2-1.5B-Instruct"
        "--device=cuda"
      ];
    };
  };
}
