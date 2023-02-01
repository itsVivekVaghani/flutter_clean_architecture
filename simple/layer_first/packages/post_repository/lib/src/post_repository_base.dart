import 'dart:async';

import 'package:layer_first_api/layer_first_api.dart';
import 'package:layer_first_api/src/models/post.dart';

class PostRepository {
  PostRepository({LayerFirstApiClient? layerFirstApiClient})
      : _layerFirstApiClient = layerFirstApiClient ?? LayerFirstApiClient();

  final LayerFirstApiClient _layerFirstApiClient;

  Future<List<Post>> getPosts() async {
    final posts = await _layerFirstApiClient.getPost();
    return posts;
  }
}