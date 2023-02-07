

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:layer_first_api/layer_first_api.dart';
import 'package:post_repository/models/post_model.dart';
import 'package:post_repository/models/post_request.dart';

abstract class PostRepository {

  Future<List<PostResponse>> getPost();
  Future<dynamic> addPosts({required PostRequest request});
}

class HttpsPostRepository implements PostRepository {


  @override
  Future<List<PostResponse>> getPost() async {
    final response = await LayerFirstApiClient.getPost();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = jsonDecode(response.body.toString());
      return (body as List?) != null
      ? (body as List)
        .map((i) => PostResponse.fromJson(i))
        .toList()
        : [];
    } else {
      throw "Something went wrong";
    }
  }

  @override
  Future<dynamic> addPosts({required PostRequest request}) async{
    final response = await LayerFirstApiClient.addPost(model: request);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = jsonDecode(response.body.toString());
      return body;
    } else {
      throw "Something went wrong";
    }
  }

}
