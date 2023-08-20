import 'package:google_sheet/sheetscolumn.dart';
import 'package:gsheets/gsheets.dart';

class SheetGoogle {
  static String _sheetId = "1z4yCnXrwfh9raTvBZK7u53fQSpb-sV3xfic0SXyjQME";

  static const _sheetCredentials = r'''
{
  "type": "service_account",
  "project_id": "leafy-catbird-396406",
  "private_key_id": "501fae78c5cd350949e9139949fdda0bc794ae5f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDWdGFhYjKyD5LB\nAjKu/i+U8VvuIktZfQA4hI22gtOk5SVZQdKLpAmZvf8tB6BXwwU+u6ukCUnecFpS\nLDEXfDoJTN1D5NwMv0NKSVy14zQgEwMtha5uj0yFnZR74xEjXpCu4b/HYSlEA/CO\nJT3N5yWzuYmJ3NUjh7sywhPER2B3UlMq7MpvsJyGe3gYfUJR4UfZT3645S5WYCJ0\nXkMA+BTbZpVfkDQKMW7x7Sn6CjHBo1pLfF/YJMO0zhULsngqlKy5wRJW9H0//3rz\niGxylHqzAENHcAvuFPD7ybiFbB1VLvZfq4LqRV5h87D75oYotMAiLFKVc+GnC0Vi\nGH7NJWShAgMBAAECggEABJZ0xtqM7xY6M3rSjr/NUMhhCRUeu4lbCdp8FZ1y3aIx\nTFmGIYqe0fUoklQJcBcx84ecQmQYenO42u0rF6+GplBIo30v3+3viJVNMG7t3InL\nlZu4gZD7OBiI5qWS5kjNm5AkxCUl9tiGuuO9ELyTJ+ceNB7PSHVM4ecY+Sf1vlew\nfOU6vRJTmF/5JToCpQhGJ7f5moLI/5e6Ih4xHXKunmVZk9PtngTP6esfpzlDcGqR\nksMRARnCJY2ugLxmdRZJewRxkLvqvuJrRR2QDJpMGPIXGUqEStTU/6y2Hpol32MB\nVGE/KCl7vV7pL10R/qbXF6TINeLhYI8x0mxNiIDeaQKBgQDu4lYFMnYJc8rOyH2H\nYaTk4RPNwkHK5rB09muvaurTx+7wT6rT29Ujq/Xbj2es4twG1jQn/SmtydFRUiLA\nAt9O7XB8kk36Hb0s4tXSlbxGGwUDmWmUwWxfeTzterMOe2fFjmoSMpAnA62Xh+60\nC1fwQH7e9Vlf6zFeB/WV/QHcfwKBgQDl0fP2HrkssOWzrxpprN9pLeSItBoqZbGN\nv59z4VGIdPrA94SzdGYqo0QTMSHZp0SWxppt35bLi1aXddX7zzIom2SQcMArtNqP\n4ogGqOyHQ/Pv0MnrbLog8CkiFUO+l+IVik2ThNRGjOZRRwCz2r66+isawvZ8uTC/\n+ynbJ1iu3wKBgQCvNYrqHOy+WhNyP1LyrQeIaB1iWQxwiWr7HpI1AzJhSs9Rqt0c\nrqxRkZquAyyDfZDr4sg2XFTphpDkGF4sfu7SsQxEEfrnbFCIT4eNAQ4qTT8MOMVb\nudKG5CFv/QK/qHugRqg92KAqPWRhM+48V+WT7XoghcubsqFu2l+iNwPaeQKBgQDd\nCEOBp+Ti1bPmT/ewQSKR7yCIVeeAdVQCB5VdBwy6l/9/Tc9kJQQJ6AKWDsAGrHgs\nJxDpsYw/cWCzxRIr4AfWxDVBMh+xKXy3u+ClvxvVsIZRVNaOxYByI2j8LcV87mjz\n3JNl2O+sduEgtJA5ap3cCLUiRPZ52EbJrc+AxmPlswKBgQCLq+veU6Gzg5hgDeJW\ncPMI7jrKQq30EdRQRZeJP0a6h5llquULiBX3Bl+apeQEjTLPHa0ttOMBaLAUOnGL\ncazuEX1XcYmQ6cIyWyMWmW1Q952I9A2e0BCe68CQ4tkuu4p1UxcMUtZa04wx/n4D\nLXSnKSl2tIkMNlAd6lIuuoDV1g==\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttersheet@leafy-catbird-396406.iam.gserviceaccount.com",
  "client_id": "107377187728754863597",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttersheet%40leafy-catbird-396406.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

  static Worksheet? _userSheet; // Object is created for worksheet class

  static final _gsheets = GSheets(_sheetCredentials); // Added credential

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId); // Sheet id pass
      _userSheet = await _getWorkSheet(spreadsheet, title: "sarwar");

      //========================= XXX =============================

      final firstRow = SheetsColumn.getColumns(); // Static method

      // Data Inserted...
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }


  // Data Insert....from text field
  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}