import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

final class PostRepository{

  static const _postLimit = 20;
  final http.Client _httpClient;
  static const _baseUrlPost = 'jsonplaceholder.typicode.com';
  PostRepository({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<List<Post>> fetchPosts([int startIndex = 0]) async {
    final response = await _httpClient.get(
      Uri.https(
        _baseUrlPost,
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Post(
          id: map['id'] as int,
          title: map['title'] as String,
          body: map['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}