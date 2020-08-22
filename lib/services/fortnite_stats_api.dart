import 'dart:convert';
import 'package:http/http.dart' as http;

class FortniteStats {
  final String platform, userId, url;
  FortniteStats({this.platform, this.userId, this.url});

  Future getStats() async {
    http.Response response = await http.get('$url/$platform/$userId', headers: {
      'TRN-Api-Key': 'a968bd19-53b4-48ad-bd68-dd87b29f1800',
    });
    
    if (response.statusCode == 200) {
      String stats = response.body;
      return jsonDecode(stats);
    } else {
      print('${response.statusCode} there was an error');
    }
  }
}
