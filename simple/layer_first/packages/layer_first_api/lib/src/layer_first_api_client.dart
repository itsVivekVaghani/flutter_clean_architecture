import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:layer_first_api/src/models/post.dart';

class PostRequestFailure implements Exception {}

class PostNotFoundFailure implements Exception {}

class LayerFirstApiClient {
  /// {@macro open_meteo_api_client}
  LayerFirstApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client _httpClient;

  /// Fetches [Weather] for a given [latitude] and [longitude].
  Future<List<Post>> getPost() async {
    final request = Uri.https(_baseUrl, 'post', {});

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw PostRequestFailure();
    }

    final bodyJson = jsonDecode(response.body);

    // if (!bodyJson.containsKey('current_weather')) {
    //   throw PostNotFoundFailure();
    // }

    // final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;
    return (bodyJson as List?) != null
        ? (bodyJson as List)
        .map((i) => Post.fromJson(i))
        .toList()
        : [];
    // return Weather.fromJson(weatherJson);
  }
}
