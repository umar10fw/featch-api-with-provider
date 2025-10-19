import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/post_provider.dart';
import '../widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostProvider>(context, listen: false).fetchPosts();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts with Provider")),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (postProvider.error != null) {
            return Center(child: Text(postProvider.error!));
          } else {
            final posts = postProvider.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostItem(post: posts[index], index: index);
              },
            );
          }
        },
      ),
    );
  }
}
