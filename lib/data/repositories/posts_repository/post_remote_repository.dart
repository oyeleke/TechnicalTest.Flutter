import '../../../app/app.locator.dart';
import '../../../utils/result.dart';
import '../../models/post_model.dart';
import '../../services/api_service.dart';

abstract class PostRemoteRepository {
  Future<Result<List<Post>>> fetchPosts();

  Future<Result<Post>> fetchPostById({required int postId});
}

class PostRemoteRepositoryImpl extends PostRemoteRepository {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<Result<Post>> fetchPostById({required int postId}) async {
    final path = '/posts/$postId';
    final res = await _apiService.get(path: path);
    return switch (res) {
      Success() => Result.success(
          data: Post.fromJson(res.data),
        ),
      Failure() => Result.failure(error: res.error)
    };
  }

  @override
  Future<Result<List<Post>>> fetchPosts() async {
    const path = '/posts';
    final res = await _apiService.get(path: path);
    return switch (res) {
      Success() => Result.success(
          data: List<Post>.from(
            res.data.map(
              (e) => Post.fromJson(e),
            ),
          ),
        ),
      Failure() => Result.failure(error: res.error)
    };
  }
}
