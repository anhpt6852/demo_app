import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';

import '../constants.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var reponse = await client.get(url);

    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
