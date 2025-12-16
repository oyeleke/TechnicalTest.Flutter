import 'package:flutter_tech_task/data/models/post_comment_model.dart';

import '../../../utils/result.dart';

abstract class PostCommentLocalRepository {
  Future<Result<List<PostCommentModel>>> getCommentsForPost(
      {required int postId});

  Future<Result<void>> saveCommentsForPost({
    required int postId,
    required List<PostCommentModel> comments,
  });

  Future<Result<void>> deleteCommentsForPost({required int postId});
}
