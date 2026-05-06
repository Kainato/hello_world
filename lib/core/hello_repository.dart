import 'package:flutter/material.dart';
import 'package:hello_world/core/classes/hello_class.dart';

class HelloRepository {
  static List<HelloClass> hellos = [
    HelloClass(label: "Olá", language: "Português", flagEmote: "🇧🇷"),
    HelloClass(label: "Hello", language: "Inglês", flagEmote: "🇺🇸"),
    HelloClass(label: "Bonjour", language: "Francês", flagEmote: "🇫🇷"),
    HelloClass(label: "Hallo", language: "Alemão", flagEmote: "🇩🇪"),
    HelloClass(label: "Ciao", language: "Italiano", flagEmote: "🇮🇹"),
    HelloClass(label: "こんにちは", language: "Japonês", flagEmote: "🇯🇵"),
    HelloClass(label: "안녕하세요", language: "Coreano", flagEmote: "🇰🇷"),
    HelloClass(label: "مرحبا", language: "Árabe", flagEmote: "🇸🇦"),
    HelloClass(label: "Привет", language: "Russo", flagEmote: "🇷🇺"),
    HelloClass(label: "Hola", language: "Espanhol", flagEmote: "🇪🇸"),
    HelloClass(label: "Merhaba", language: "Turco", flagEmote: "🇹🇷"),
    HelloClass(label: "שלום", language: "Hebraico", flagEmote: "🇮🇱"),
    HelloClass(label: "नमस्ते", language: "Hindi", flagEmote: "🇮🇳"),
    HelloClass(label: "你好", language: "Chinês", flagEmote: "🇨🇳"),
  ];

  static List<Color> colors = [
    Colors.red.shade900,
    Colors.green.shade900,
    Colors.blue.shade900,
    Colors.yellow.shade900,
    Colors.amber.shade900,
    Colors.orange.shade900,
    Colors.purple.shade900,
    Colors.brown.shade900,
    Colors.cyan.shade900,
    Colors.lime.shade900,
    Colors.teal.shade900,
    Colors.indigo.shade900,
    Colors.pink.shade900,
    Colors.grey.shade900,
  ];
}
