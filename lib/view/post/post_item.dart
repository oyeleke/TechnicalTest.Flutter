import 'package:flutter/material.dart';
import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../data/models/post_model.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<NavigationService>()
          .navigateToPostDetailView(postId: post.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(post.body),
            Container(height: 8),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
