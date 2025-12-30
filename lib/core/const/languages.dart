class Languages {
  const Languages._();

  static List<Language> get() => [
        Language(code: 'en', label: 'English'),
        Language(code: 'hi', label: 'हिन्दी'),
      ];

  static Language getLanguageByCode(String code) {
    return get().where((language) => language.code == code).first;
  }
}

class Language {
  final String code;
  final String label;

  Language({
    required this.code,
    required this.label,
  });
}

class ContentLanguages {
  const ContentLanguages._();

  static String english = "English";
  static String hindi = "हिन्दी";
  static String bengali = "বাংলা";
  static String kannada = "ಕন্নಡ";
  static String gujarati = "ગુજરાતી";
  static String kashmiri = "काश्मीरी";
  static String telugu = "తెలుగు";
  static String tamil = "తమిళం";
  static String sindhi = "సింధీ";
  static String maithili = "मैथिली";

  static List<String> get values => [
        english,
        hindi,
        bengali,
        kannada,
        gujarati,
        kashmiri,
        telugu,
        tamil,
        sindhi,
        maithili,
      ];
}
