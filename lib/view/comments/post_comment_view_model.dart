import 'package:flutter_tech_task/data/models/post_comment_model.dart';
import 'package:flutter_tech_task/data/repositories/post_comment_repository/post_comment_local_repository.dart';
import 'package:flutter_tech_task/data/repositories/post_comment_repository/post_comment_remote_repository.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../utils/result.dart';
import '../../utils/ui_state.dart';
import '../../utils/ui_state_holder.dart';

class PostCommentViewModel extends ReactiveViewModel{
  final UiStateHolder<List<PostCommentModel>> _postCommentUiStateHolder = UiStateHolder();

  UiStateHolder<List<PostCommentModel>> get postCommentUiStateHolder => _postCommentUiStateHolder;
  final _postCommentRemoteRepository = locator<PostCommentRemoteRepository>();
  final _postCommentLocalRepository = locator<PostCommentLocalRepository>();
  final _postLocalRepository = locator<PostLocalRepository>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_postCommentUiStateHolder];

  initViewModel({required int postId}) async {
    await _initViewModel(postId: postId);
  }

  Future _initViewModel({required int postId}) async {
    getPostComments(postId: postId);
  }

  void getPostComments({required int postId}) async {
    _postCommentUiStateHolder.updateUiState(newUiState: const UiState.loading());
    final isAvailableOnLocalRes =
    await _postLocalRepository.isPostSaved(postId: postId);
    final res = switch (isAvailableOnLocalRes) {
      Success() => isAvailableOnLocalRes.data
          ? await _postCommentLocalRepository.getCommentsForPost(postId: postId)
          : await _postCommentRemoteRepository.getPostComment(postId: postId),
      Failure() => await _postCommentRemoteRepository.getPostComment(postId: postId)
    };

    switch (res) {
      case Success():
        _postCommentUiStateHolder.updateUiState(
            newUiState: UiState.viewData(data: res.data));
        break;
      case Failure():
        _postCommentUiStateHolder.updateUiState(
            newUiState: UiState.viewError(errorMessage: res.error.toString()));
    }
  }
}