{ ... }: {
  # Ollama
  virtualisation.oci-containers.containers = {
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

  # Periodically update HomeAssistant + DuckDNS
  systemd = {
    timers.ollama-update = {
      wantedBy = [ "timers.target" ];
      partOf = [ "ollama-update.service" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    services.ollama-update = {
      serviceConfig.Type = "oneshot";
      script = ''
        /run/current-system/sw/bin/podman pull ollama/ollama
        systemctl restart podman-ollama.service

        /run/current-system/sw/bin/podman pull ghcr.io/open-webui/open-webui:main 
        systemctl restart podman-open-webui.service

        /run/current-system/sw/bin/podman system prune -f
      '';
    };
  };
}
