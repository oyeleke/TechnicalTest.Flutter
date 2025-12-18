import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_remote_repository.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_tech_task/utils/ui_state.dart';
import 'package:flutter_tech_task/utils/ui_state_holder.dart';
import 'package:stacked/stacked.dart';

class PostDetailViewModel extends ReactiveViewModel {
  final UiStateHolder<Post> _postDetailUiStateHolder = UiStateHolder();

  UiStateHolder<Post> get postDetailUiStateHolder => _postDetailUiStateHolder;
  final _postRemoteRepository = locator<PostRemoteRepository>();
  final _postLocalRepository = locator<PostLocalRepository>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_postDetailUiStateHolder];

  initViewModel({required int postId}) async {
    await _initViewModel(postId: postId);
  }

  Future _initViewModel({required int postId}) async {
    getPostDetail(postId: postId);
  }

  void getPostDetail({required int postId}) async {
    _postDetailUiStateHolder.updateUiState(newUiState: const UiState.loading());
    final isAvailableOnLocalRes =
        await _postLocalRepository.isPostSaved(postId: postId);
    final res = switch (isAvailableOnLocalRes) {
      Success() => isAvailableOnLocalRes.data
          ? await _postLocalRepository.fetchPostById(postId: postId)
          : await _postRemoteRepository.fetchPostById(postId: postId),
      Failure() => await _postRemoteRepository.fetchPostById(postId: postId)
    };

    switch (res) {
      case Success():
        _postDetailUiStateHolder.updateUiState(
            newUiState: UiState.viewData(data: res.data));
        break;
      case Failure():
        _postDetailUiStateHolder.updateUiState(
            newUiState: UiState.viewError(errorMessage: res.error.toString()));
    }
  }
}
