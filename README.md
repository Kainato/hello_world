# hello_world

A new Flutter project.

## 🚀 Quick Start

### Prerequisites
- Flutter SDK installed
- Android Studio installed (macOS)
- Java Development Kit (OpenJDK)

### Setup Android Development Environment (macOS)

#### 1. Recarregue o Terminal
```fish
exec fish
```

#### 2. Abra o Android Studio
```fish
open -a "Android Studio"
```

Na primeira execução:
- Android Studio instalará automaticamente o SDK
- Será necessário aceitar as licenças
- Processo pode levar 5-10 minutos

#### 3. Compile para Android
```fish
# Instalar dependências
flutter pub get

# Build APK para testes
flutter build apk

# Build Bundle para Play Store
flutter build appbundle

# Executar em emulador
flutter run
```

## 📱 Estrutura do Projeto

```
hello_world/
├── android/                 # Código Android nativo
│   ├── app/
│   ├── gradle/
│   ├── local.properties     # Configuração local (SDK path)
│   └── settings.gradle.kts
├── lib/                     # Código Flutter (Dart)
│   ├── main.dart
│   ├── core/
│   └── presentation/
├── ios/                     # Código iOS
├── web/                     # Código Web
├── linux/                   # Código Linux
├── macos/                   # Código macOS
├── windows/                 # Código Windows
└── pubspec.yaml            # Dependências do projeto
```

## 🔧 Configuração Android

### Variáveis de Ambiente (Fish Shell)
- **ANDROID_HOME**: `$HOME/Library/Android/sdk`
- **JAVA_HOME**: `/opt/homebrew/opt/openjdk`
- **PATH**: Inclui emulator, tools, platform-tools, cmdline-tools

### Arquivo local.properties
Configurado automaticamente em `android/local.properties`:
```properties
sdk.dir=/Users/teatec/Library/Android/sdk
flutter.sdk=/opt/homebrew/Caskroom/flutter/3.32.2/flutter
flutter.buildMode=release
flutter.versionName=0.1.0
```

## 📚 Documentação Adicional

Para instruções detalhadas sobre a configuração do Android SDK:
- Veja: `ANDROID_SETUP_COMPLETE.md` (neste diretório)
- Veja: `~/ANDROID_SDK_SETUP.md` (sua home)

## 🆘 Troubleshooting

### Erro: "Android SDK not found"
```fish
open -a "Android Studio"
# Configure em: Settings → Languages & Frameworks → Android SDK
# SDK Location: /Users/teatec/Library/Android/sdk
```

### Erro: "Java not found"
```fish
java -version
# Se não funcionar, reinstale com:
brew install openjdk
```

### Limpeza de Build
```fish
flutter clean
flutter pub get
flutter build apk
```

## 📦 Build para Produção

### Gerar APK Assinado
```fish
flutter build apk --release
# APK estará em: build/app/outputs/flutter-apk/app-release.apk
```

### Gerar App Bundle (Play Store)
```fish
flutter build appbundle --release
# Bundle estará em: build/app/outputs/bundle/release/app-release.aab
```

## 🎯 Recursos Úteis

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter for Android](https://flutter.dev/docs/get-started/install/macos#android-setup)
- [Android Studio](https://developer.android.com/studio)
- [Dart Language](https://dart.dev)

---

**Last Updated**: 28 de abril de 2026
**Platform**: macOS (Apple Silicon)
**Android SDK**: Configurado e Pronto
