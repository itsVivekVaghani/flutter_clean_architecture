import 'dart:async';
import 'dart:convert';
import 'package:post_repository/models/post_request.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "jsonplaceholder.typicode.com";

class LayerFirstApiClient {
  static Future<http.Response> getPost() async {
    final request = Uri.https(BASE_URL, 'posts');
    final response = await http.Client().get(request);
    return response;
  }

  static Future<http.Response> addPost({required PostRequest model}) async {
    final request = Uri.https(BASE_URL, 'posts');
    final response = await http.Client().post(
      request,
      body: jsonEncode(model.toJson()),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
}
