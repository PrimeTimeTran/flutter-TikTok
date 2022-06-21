import 'dart:convert';

class PhraseFields {
  static const String id = 'id';
  static const String vi = 'vi';
  static const String en = 'en';

  static List<String> getFields() => [id, vi, en];
}

class Phrase {
  final String? id;
  final String en;
  final String vi;

  const Phrase({
    this.id,
    required this.en,
    required this.vi,
  });

  Phrase copy({
    String? id,
    String? vi,
    String? en,
  }) =>
      Phrase(
        id: id ?? this.id,
        en: en ?? this.en,
        vi: vi ?? this.vi,
      );

  static Phrase fromJson(Map<String, dynamic> json) => Phrase(
        id: json[PhraseFields.id],
        en: json[PhraseFields.en],
        vi: json[PhraseFields.vi],
      );

  Map<String, dynamic> toJson() => {
        PhraseFields.id: id,
        PhraseFields.en: en,
        PhraseFields.vi: vi,
      };
}
