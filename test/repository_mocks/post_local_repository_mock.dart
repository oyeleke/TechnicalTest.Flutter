import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';

class PostLocalRepositoryMock extends PostLocalRepository{
  final List<Post> _savedPostList = [];


  @override
  Future<Result<bool>> deleteSavedPost({required int postId}) async {
    final postIndex = _savedPostList.indexWhere((post)=> post.id == postId);
    if(postIndex < 0) {
      return Result.failure(error: DatabaseException(message: "Post not found"));
    } else {
      _savedPostList.removeAt(postIndex);
      return const Result.success(data: true);
    }
  }

  @override
  Future<Result<Post>> fetchPostById({required int postId}) async {
    final postIndex = _savedPostList.indexWhere((post)=> post.id == postId);
    if(postIndex < 0) {
      return Result<Post>.failure(error: DatabaseException(message: "Post not found"));
    } else {
      return Result.success(data: _savedPostList.elementAt(postIndex));
    }
  }

  @override
  Future<Result<List<Post>>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }

  @override
  Stream<Result<List<Post>>> fetchPostsStream() {
    // TODO: implement fetchPostsStream
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> isPostSaved({required int postId}) async {
    final postIndex = _savedPostList.indexWhere((post)=> post.id == postId);
    if(postIndex < 0) {
      return  const Result.success(data: false);
    } else {
     return const Result.success(data: true);
    }
  }

  @override
  Future<Result<bool>> savePost({required Post post}) async {
    _savedPostList.add(post);
    return const Result.success(data: true);
  }

}