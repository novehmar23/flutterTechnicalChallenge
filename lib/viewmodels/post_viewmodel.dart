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

      // Fetch posts for the current page
      final newPosts = await _repository.fetchPosts(page: currentPage);

      if (newPosts.isNotEmpty) {
        posts = newPosts;

        // Check if the next page has posts
        final nextPosts = await _repository.fetchPosts(page: currentPage + 1);

        // If the next page is empty, mark hasMore as false
        hasMore = nextPosts.isNotEmpty;
      } else {
        hasMore = false; // No posts available, set hasMore to false
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
