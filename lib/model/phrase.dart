import 'dart:convert';

class PhraseFields {
  static const String id = 'id';
  static const String vi = 'vi';
  static const String en = 'en';
  static const String author = 'author';

  static List<String> getFields() => [id, vi, en, author];
}

class Phrase {
  final String id;
  final String en;
  final String vi;
  final String author;

  const Phrase({
    required this.id,
    required this.en,
    required this.vi,
    required this.author,
  });

  Phrase copy({
    String? id,
    String? vi,
    String? en,
    String? author,
  }) =>
      Phrase(
        id: id ?? this.id,
        en: en ?? this.en,
        vi: vi ?? this.vi,
        author: author ?? this.author,
      );

  static Phrase fromJson(Map<String, dynamic> json) => Phrase(
        id: json[PhraseFields.id],
        en: json[PhraseFields.en],
        vi: json[PhraseFields.vi],
        author: json[PhraseFields.author],
      );

  Map<String, dynamic> toJson() => {
        PhraseFields.id: id,
        PhraseFields.en: en,
        PhraseFields.vi: vi,
        PhraseFields.author: author,
      };
}
