class HelloClass {
  String label;
  String language;
  String flagEmote;

  HelloClass({
    required this.label,
    required this.language,
    required this.flagEmote,
  });

  @override
  String toString() {
    return 'HelloClass{label: $label, language: $language, flagEmote: $flagEmote}';
  }
}
