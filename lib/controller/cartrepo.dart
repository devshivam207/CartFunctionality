import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restaurant/models/fmodel.dart';

class Repository {
  static String baseurl =
      "https://raw.githubusercontent.com/devshivam207/agro_api_testing/";
  var api = "${baseurl}main/restaurant.json";

  Dio _dio = Dio();

  Future<Food> getlist() async {
    Response response = await _dio.get(api);
    return Food.fromJson((jsonDecode(response.data)));
  }
}
