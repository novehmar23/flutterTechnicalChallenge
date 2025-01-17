import 'package:flutter/material.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';

class PostViewModel with ChangeNotifier {
  final PostRepository _repository = PostRepository();
  List<Post> posts = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchPosts() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      posts = await _repository.fetchPosts();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
