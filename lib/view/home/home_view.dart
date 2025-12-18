import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/saved_posts/saved_post_view.dart';

import '../../generated/l10n.dart';
import '../post/post_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.home),
          bottom: TabBar(
            tabs: [
              Tab(text: S.current.posts),
              Tab(text: S.current.savedPosts),
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
