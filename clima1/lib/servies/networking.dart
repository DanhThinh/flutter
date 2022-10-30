import 'package:http/http.dart' as http;
import 'dart:convert';

class networkHelp {
  networkHelp(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
