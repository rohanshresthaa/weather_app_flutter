import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String url;

  Api(this.url);
  Future getData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
