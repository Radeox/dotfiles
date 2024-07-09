{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-studio
    dart
    flutter
    jdk
    scrcpy
  ];
}
