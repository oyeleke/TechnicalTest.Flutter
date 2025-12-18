import 'package:flutter_tech_task/data/repositories/post_comment_repository/post_comment_local_repository.dart';
import 'package:flutter_tech_task/data/repositories/post_comment_repository/post_comment_remote_repository.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';

import '../app/app.locator.dart';
import '../data/models/post_model.dart';
import '../generated/l10n.dart';

class SavePostUseCase {
  final PostLocalRepository _postLocalRepository =
      locator<PostLocalRepository>();
  final PostCommentLocalRepository _postCommentLocalRepository =
      locator<PostCommentLocalRepository>();
  final PostCommentRemoteRepository _postCommentRemoteRepository =
      locator<PostCommentRemoteRepository>();

  Future<Result<bool>> savePostAndComments({required Post post}) async {
    try {
      final postResult = await _postLocalRepository.savePost(post: post);
      switch (postResult) {
        case Failure():
          return Result.failure(error: postResult.error);
        case Success():
      }

      final postCommentsResult =
          await _postCommentRemoteRepository.getPostComment(postId: post.id);
      switch (postCommentsResult) {
        case Failure():
          return Result.failure(error: postCommentsResult.error);
        case Success():
      }

      final savePostCommentsResult =
          await _postCommentLocalRepository.saveCommentsForPost(
              postId: post.id, comments: postCommentsResult.data);
      return switch (savePostCommentsResult) {
        Success() => const Result.success(data: true),
        Failure() => Result.failure(error: savePostCommentsResult.error)
      };
    } catch (e) {
      return Result.failure(
        error: AppException(message: "Unable to save post"),
      );
    }
  }

  Future<Result<bool>> deletePostAndComments({required int postId}) async {
    try {
      final postResult =
          await _postLocalRepository.deleteSavedPost(postId: postId);
      switch (postResult) {
        case Failure():
          return Result.failure(error: postResult.error);
        case Success():
      }

      final postCommentsResult = await _postCommentLocalRepository
          .deleteCommentsForPost(postId: postId);
      return switch (postCommentsResult) {
        Success() => const Result.success(data: false),
        Failure() => Result.failure(error: postCommentsResult.error)
      };
    } catch (e) {
      return Result.failure(
        error: AppException(message: S.current.unableToDeletePosts),
      );
    }
  }
}
