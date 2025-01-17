import 'package:flutter/material.dart';
import '../repositories/post_repository.dart';
import '../models/post.dart';

class PostViewModel with ChangeNotifier {
  final PostRepository _repository = PostRepository();
  List<Post> posts = [];
  bool isLoading = false;
  String? error;
  int currentPage = 1;
  bool hasMore = true;

  Future<void> fetchPosts() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final newPosts = await _repository.fetchPosts(page: currentPage);

      if (newPosts.isNotEmpty) {
        posts = newPosts;
        hasMore = newPosts.length == 10;
      }
    } catch (e) {
      error = e is Exception
          ? e.toString().replaceFirst('Exception: ', '')
          : 'Unknown error';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void nextPage() {
    currentPage++;
    fetchPosts();
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      fetchPosts();
    }
  }
}
