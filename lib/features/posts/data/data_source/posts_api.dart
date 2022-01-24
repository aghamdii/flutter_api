// Class to deal with network requests
import 'dart:convert';

import 'package:http/http.dart' as http;

class PostsApi {
  Future<List<dynamic>> getPosts() async {
    try {
      var url = Uri.parse(
          "https://gnews.io/api/v4/top-headlines?token=de5f5cac0a8a3c22780a14c2e2479a74&lang=en");
      var response = await http.get(url);
      var parsed = json.decode(response.body) as Map;
      return parsed["articles"];
    } catch (e) {
      throw Exception("Error in api");
    }
  }
}
