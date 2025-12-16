import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_comment_model.dart';
import 'package:flutter_tech_task/data/services/api_service.dart';
import 'package:flutter_tech_task/utils/result.dart';

abstract class PostCommentRemoteRepository {
  Future<Result<List<PostCommentModel>>> getPostComment({required int postId});
}

class PostCommentRemoteRepositoryImpl extends PostCommentRemoteRepository {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<Result<List<PostCommentModel>>> getPostComment(
      {required int postId}) async {
    final path = '/posts/$postId/comments';
    final res = await _apiService.get(path: path);
    return switch (res) {
      Success() => Result.success(
          data: List<PostCommentModel>.from(
            res.data.map(
              (e) => PostCommentModel.fromJson(e),
            ),
          ),
        ),
      Failure() => Result.failure(error: res.error),
    };
  }
}
