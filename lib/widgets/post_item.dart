import 'package:flutter/material.dart';

import '../model/post_model.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final int index;

  const PostItem({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
          Colors.primaries[index % Colors.primaries.length],
          child: Text(
            post.id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}
