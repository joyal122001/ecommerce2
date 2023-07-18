import 'dart:convert';

import 'package:http/http.dart' as http;

class APIHandler {
static  Future<void> getAllProducts ()async{
    var response=
      await  http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
      print("response ${jsonDecode(response.body)}");
  }
}
