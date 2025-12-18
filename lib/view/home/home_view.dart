import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/saved_posts/saved_post_view.dart';

import '../post/post_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Posts"),
              Tab(text: "Saved Posts"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [PostView(), SavedPostView()],
        ),
      ),
    );
  }
}
