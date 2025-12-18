import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/test_helpers.dart';

void main() {
  late PostLocalRepository postLocalRepository;

  setUp(() {
    registerServices();
    postLocalRepository = locator<PostLocalRepository>();
  });

  test("successful post local repository fetch post with ID", () async {
    final Post post = Post(id: 0, userId: 0, title: "test", body: "body");
    final res = await postLocalRepository.savePost(post: post);
    expect(res, Result.success(data: true));

    final fetchRes = await postLocalRepository.fetchPostById(postId: 0);
    expect(fetchRes, Result.success(data: post));
  });

  tearDown(() {
    unregisterServices();
  });
}
