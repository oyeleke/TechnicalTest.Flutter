import '../../../utils/result.dart';
import '../../models/post_model.dart';

abstract class PostRemoteRepository{
  Future<Result<List<Post>>> fetchPosts();

  Future<Result<Post>> fetchPostById({required int postId});
}