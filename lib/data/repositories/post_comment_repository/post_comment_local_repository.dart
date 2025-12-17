import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_comment_model.dart';
import 'package:flutter_tech_task/data/services/database_service.dart';
import 'package:flutter_tech_task/objectbox.g.dart';

import '../../../utils/app_exceptions.dart';
import '../../../utils/result.dart';

abstract class PostCommentLocalRepository {
  Future<Result<List<PostCommentModel>>> getCommentsForPost(
      {required int postId});

  Future<Result<void>> saveCommentsForPost({
    required int postId,
    required List<PostCommentModel> comments,
  });

  Future<Result<bool>> deleteCommentsForPost({required int postId});
}

class PostCommentLocalRepositoryImpl extends PostCommentLocalRepository {
  final _postCommentLocalBox = locator<DatabaseService>().getPostCommentStore();

  @override
  Future<Result<bool>> deleteCommentsForPost({required int postId}) async {
    try {
      final query =
          (_postCommentLocalBox.query(PostCommentModel_.postId.equals(postId)))
              .build();
      final queryResults = query.find();
      final listOfCommentIds =
          queryResults.map((comment) => comment.id).toList();
      final res = await _postCommentLocalBox.removeManyAsync(listOfCommentIds);
      if (res > 0) {
        return const Result.success(data: true);
      } else {
        return Result.failure(
            error: DatabaseException(message: "No comments deleted"));
      }
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<List<PostCommentModel>>> getCommentsForPost(
      {required int postId}) async {
    try {
      final query =
          (_postCommentLocalBox.query(PostCommentModel_.postId.equals(postId)))
              .build();
      final queryResults = query.find();
      return Result.success(data: queryResults);
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<void>> saveCommentsForPost(
      {required int postId, required List<PostCommentModel> comments}) async {
    try {
      _postCommentLocalBox.putMany(comments);
      return const Result<bool>.success(data: true);
    } catch (e) {
      return Result.failure(
          error: DatabaseException(
              message: "An error occurred while saving comments"));
    }
  }
}
