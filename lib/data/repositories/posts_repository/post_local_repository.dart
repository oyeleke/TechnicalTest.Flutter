
import '../../../utils/result.dart';
import '../../models/post_model.dart';

abstract class PostRemoteRepository{
  Future<Result<List<Post>>> fetchPosts();

  Future<Result<Post>> fetchPostById({required int postId});

  Future<Result<bool>> savePost({required Post post});

  Future<Result<bool>> deleteSavedPost({required int postId});

  Future<Result<bool>> isPostSaved({required int postId});
}