import 'package:gsheets/gsheets.dart';

import 'package:worldlingo3/model/phrase.dart';

class PhraseSheetsApi {
  static const _credentials = r'''
    {
      "type": "service_account",
      "project_id": ${dotenv.env['project_id']},
      "private_key_id": "${dotenv.env['private_key_id']}",
      "private_key": ${dotenv.env['private_key']},
      "client_email": ${dotenv.env['client_email']},
      "client_id": ${dotenv.env['client_id']},
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": ${dotenv.env['client_x509_cert_url']}
    }
  ''';

  static Worksheet? _phraseSheet;
  static const _spreadsheetId = '1AT55CYUZfzLOu32jrO7UQP2TV_Mw5AjvfDFNbYaZpQ0';
  static final _gsheets = GSheets(_credentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _phraseSheet = await _getWorkSheet(spreadsheet, title: 'Phrases');
      final firstRow = PhraseFields.getFields();
      _phraseSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      // print('Init Error: $e');
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_phraseSheet == null) return;
    _phraseSheet!.values.map.appendRows(rowList);
  }

  static Future<Phrase?> getById(int id) async {
    if (_phraseSheet == null) return null;
    final json = await _phraseSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Phrase.fromJson(json);
  }

  static Future<List<Phrase>> getAll() async {
    if (_phraseSheet == null) return <Phrase>[];

    final phrases = await _phraseSheet!.values.map.allRows();
    return phrases == null ? <Phrase>[] : phrases.map(Phrase.fromJson).toList();
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
