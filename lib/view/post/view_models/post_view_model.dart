import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_remote_repository.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_tech_task/utils/ui_state.dart';
import 'package:flutter_tech_task/utils/ui_state_holder.dart';
import 'package:stacked/stacked.dart';

class PostViewModel extends ReactiveViewModel {
  final UiStateHolder<List<Post>> _postUiStateHolder = UiStateHolder();

  UiStateHolder<List<Post>> get postUiStateHolder => _postUiStateHolder;
  final _postRemoteRepository = locator<PostRemoteRepository>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_postUiStateHolder];

  initViewModel() async {
    await _initViewModel();
  }

  Future _initViewModel() async {
    getPosts();
  }

  void getPosts() async {
    _postUiStateHolder.updateUiState(newUiState: const UiState.loading());
    final res = await _postRemoteRepository.fetchPosts();
    switch (res) {
      case Success<List<Post>>():
        _postUiStateHolder.updateUiState(
            newUiState: UiState<List<Post>>.viewData(data: res.data));
        break;
      case Failure<List<Post>>():
        _postUiStateHolder.updateUiState(
            newUiState: UiState<List<Post>>.viewError(
                errorMessage: res.error.toString()));
    }
  }
}
