import 'package:flutter/material.dart';
import '../repositories/post_repository.dart';
import '../models/post.dart';

class DetailsScreen extends StatelessWidget {
  final int postId;

  DetailsScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: PostRepository().fetchPostDetails(postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text('Post Details')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Error pop up
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Only show pop up one time
            if (!snapshot.hasError) return;

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(snapshot.error.toString()),
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

          return Scaffold(
            appBar: AppBar(title: Text('Post Details')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          final post = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: Text('Post Details')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title, style: TextStyle(fontSize: 24)),
                  SizedBox(height: 16),
                  Text(post.body),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('Post Details')),
            body: Center(child: Text('No data found.')),
          );
        }
      },
    );
  }
}
