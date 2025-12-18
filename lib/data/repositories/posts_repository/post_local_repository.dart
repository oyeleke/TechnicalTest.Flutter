import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/services/database_service.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';

import '../../../generated/l10n.dart';
import '../../../utils/result.dart';
import '../../models/post_model.dart';

abstract class PostLocalRepository {
  Future<Result<List<Post>>> fetchPosts();

  Future<Result<Post>> fetchPostById({required int postId});

  Future<Result<bool>> savePost({required Post post});

  Future<Result<bool>> deleteSavedPost({required int postId});

  Future<Result<bool>> isPostSaved({required int postId});

  Stream<Result<List<Post>>> fetchPostsStream();
}

class PostLocalRepositoryImpl extends PostLocalRepository {
  final _postBox = locator<DatabaseService>().getPostBox();

  @override
  Future<Result<bool>> deleteSavedPost({required int postId}) async {
    try {
      final res = _postBox.remove(postId);
      return Result<bool>.success(data: res);
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<Post>> fetchPostById({required int postId}) async {
    try {
      final post = _postBox.get(postId);
      if (post != null) {
        return Result<Post>.success(data: post);
      } else {
        return Result.failure(
            error: DatabaseException(message: "Post not found"));
      }
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<List<Post>>> fetchPosts() async {
    try {
      final res = _postBox.getAll();
      return Result.success(data: res);
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<bool>> isPostSaved({required int postId}) async {
    try {
      final res = _postBox.contains(postId);
      return Result<bool>.success(data: res);
    } catch (e) {
      return Result.failure(error: DatabaseException());
    }
  }

  @override
  Future<Result<bool>> savePost({required Post post}) async {
    try {
      _postBox.put(post);
      return const Result<bool>.success(data: true);
    } catch (e) {
      return Result.failure(error: DatabaseException(message: S.current.anErrorOccurredWhileSavingPost));
    }
  }

  @override
  Stream<Result<List<Post>>> fetchPostsStream() async* {
    yield* _postBox.query().watch(triggerImmediately: true).map((query) => Result.success(data: query.find()));
  }
}
