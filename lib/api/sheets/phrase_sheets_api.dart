import 'package:gsheets/gsheets.dart';
import 'package:worldlingo3/model/phrase.dart';

class PhraseSheetsApi {
  static const _credentials = r'''
    {
      "type": "service_account",
      "project_id": "world-wide-words-353707",
      "private_key_id": "94978247eb7a906d526830897560753258e238f8",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCtdKUHBr6vr6U+\n5SImDcNC/ZWaMY1o11z5Vvz9fOh7zaWGGzzDU18HT8jPVb2V45EQfynDIjnMCVRg\nwFYOsZGYoPuFG0yFRrIj/erd/vVgSDmQE8lg9r4XUlxa+9+up137nu3PUbbHmI0c\nzRp7AigO/jrRfHJPfAUFXyNqnAny7VyHZfvc+PxghNNPzL9i0IRvJP3eeqN3Ox5o\nwmZwsG4TaEc2yp/qDlLqMc8TICjA35zdZiVOtfUtl5Pb2A9zDgAj4GrmzahUldOP\nzsQyq3JUUlIKWt8EYpum7UcIIS7JZn87dFDSgNnzIM1znIwfpwKX6Q/CX9lsBdBp\nTU6fUy7PAgMBAAECggEAEFg2+sAEdOqgsBoISzytwyDBGZwEvrXYgXhUc5BzGcNp\njwb/BUrUYAyBGCR0rmyYrUzGQyh0+MiCRnGpSk4qMY8t1D+byM0+GQ0ithOBzLZR\nkkWDCtuFUw5EPKCSVdNYlE7ICuqgxhMWbPnYvnGYE72aDkZjQSEnGff6jt+wQk86\ncrIWydfqQ2RtYmNJTrGqBKjNCIOewjzn/6IRqmXX4f+7xtg1EEQqcUsLf1oGe52y\nQGV4mdjSgMOZX7VvCVkJDhbGy/G6PjwbtG7xMpbeapcyi2QzB60TVpK9zmeHi/5p\nz7ThFd8WZPvngLVFFcgYKBNkc3yfbcyF+Y0FV4ATqQKBgQDzRVTv7LiHgOdeW3R9\nLaoJXWAE0LxOFZbICmBjjrhsjMlPWogJTFH1OvozeZzVwzsmF0AZwNbMSFb2YkHE\nbrXMLtWOuPgNDnSxkFHRk5XasmSa3I46DI56rZBz6H5PFvLC92LiBdh5HOWRroRv\nMcFzmlJbiQy662u9IMGH1IfUFwKBgQC2iB9epGx59akn+1frPNdbUqcTkj7J35fu\nyz0VfzmDOL6bZMo65mU4gHUdG04P/rvJkyaa2RKcTNze6xNkNZwb3gA7WTxiYTSD\n3paPm18XGw2GpzVcXcfbmCuKbX5wChZ4wLvGxoPt1xGdNAOfXNIOlFBa781+yGcD\nYfUi/DtWCQKBgA1lfwTrW0oS/irDDIosLpXvb280c3o1VCVV9PLmlB9eLWPST3V7\nn3PKuKaHBuz6oFI7q4r/hJShUzCkPozrr9U7qwT+CKLnbeOtV+QbpX/ynPmuNaLa\nuCnnTvIjFnmSgPHdn7NksQQSZE3+d0qMSePs1qY1yN6uQjObDy1EteonAoGAdVvW\nF4rOOCgMB6nh4Fyw9oWQ6NN5zWAWlrFT5/Nx7f3ZB55pLC+gWxC0u+8nZL9azALx\nqlPxVE9TH3yzbhXN9ljpez8nxPVMx5Cg61pxbDC3pKDzfRzK+FTBgfJeffjuc9sv\noGFYx94k9BdSUO9kG32eoKlYTbDaEuGztDfKiskCgYAjUJbc9mxgD9sRxHJh5NaF\n4Wep01ioizMNiU8qTzuitl7CrYEuqwkXVVbuEWbLuc0LcUBqZWGq3QWrvbU/I0fd\nCO1lfieG0UBrmjscsgBaGmKplIZeQcupyuUuna+quQ/7ac4K21wJ9UByNUYVIKer\nsOaOgBmZpT5oXSEArlV7hw==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "world-wide-words-flutter@world-wide-words-353707.iam.gserviceaccount.com",
      "client_id": "110231504874682475164",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/world-wide-words-flutter%40world-wide-words-353707.iam.gserviceaccount.com"
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
