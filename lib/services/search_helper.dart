import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchHelper {
  SearchHelper({this.url});

  final String? url;

  Future getData() async {
    final Uri uri = Uri.parse(url!);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }


}