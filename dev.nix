{pkgs}: {
  packages = [
    pkgs.flutter
    pkgs.jdk17
  ];
  
  idx.workspace.onCreate = {
    install-deps = "flutter pub get";
    generate-code = "flutter pub run build_runner build --delete-conflicting-outputs";
  };
  
  idx.workspace.onStart = {
    flutter-doctor = "flutter doctor";
  };
  
  idx.previews = {
    enable = true;
    previews = {
      web = {
        command = [
          "flutter"
          "run"
          "--web-port=8080"
          "--web-hostname=0.0.0.0"
        ];
        manager = "flutter";
      };
    };
  };
  
  idx.extensions = [
    "Dart-Code.flutter"
    "Dart-Code.dart-code"
  ];
}
