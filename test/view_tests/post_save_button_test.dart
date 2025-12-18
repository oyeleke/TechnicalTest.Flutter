import 'package:flutter/material.dart';
import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/view/post/post_save_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/test_helpers.dart';

void main() {
  late PostLocalRepository postLocalRepository;
  final Post post = Post(id: 0, userId: 0, title: "test", body: "body");

  setUp(() {
    registerServices();
    postLocalRepository = locator<PostLocalRepository>();
  });

  testWidgets('shows filled bookmark icon when post is saved', (tester) async {
    await postLocalRepository.savePost(post: post);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PostSaveButton(post: post),
        ),
      ),
    );

    await tester.pump();

    expect(find.byIcon(Icons.bookmark), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_border), findsNothing);
  });

  testWidgets('shows border bookmark when post is NOT saved', (tester) async {
    await postLocalRepository.deleteSavedPost(postId: post.id);
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(body: PostSaveButton(post: post)),
        ),
      );

    await tester.pump();

    expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
    expect(find.byIcon(Icons.bookmark), findsNothing);
  });


  tearDown(() {
    unregisterServices();
  });
}
