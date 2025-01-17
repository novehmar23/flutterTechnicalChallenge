import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_viewmodel.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostViewModel>();

    if (viewModel.error != null && viewModel.error!.isNotEmpty) {
      // Error pop up
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(viewModel.error!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Posts list
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.posts.length,
                    itemBuilder: (context, index) {
                      final post = viewModel.posts[index];
                      return ListTile(
                        title: Text(post.title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(postId: post.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Pagination with buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: viewModel.currentPage > 1
                            ? viewModel.previousPage
                            : null,
                      ),
                      Text('Página ${viewModel.currentPage}'),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed:
                            viewModel.hasMore ? viewModel.nextPage : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.fetchPosts,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
