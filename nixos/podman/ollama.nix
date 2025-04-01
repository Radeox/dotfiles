{ ... }: {
  # Ollama
  virtualisation.oci-containers = {
    backend = "podman";

    containers = {
      # Ollama
      ollama = {
        image = "ollama/ollama";
        ports = [ "11434:11434" ];
        volumes = [ "/etc/ollama/ollama-data/:/root/.ollama" ];
        extraOptions = [ "--gpus=all" ];
      };

      # Ollama Web UI
      open-webui = {
        image = "ghcr.io/open-webui/open-webui:main";
        ports = [ "9600:8080" ];
        volumes = [ "/etc/ollama/open-webui/:/app/backend/data" ];
      };
    };
  };
}
