import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts({int page = 1}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/posts?_page=$page&_limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> fetchPostDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post details');
    }
  }
}
