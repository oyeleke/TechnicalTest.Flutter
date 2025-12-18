import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../data/models/post_model.dart';
import '../../utils/result.dart';
import '../../utils/ui_state.dart';
import '../../utils/ui_state_holder.dart';

class SavedPostViewModel extends ReactiveViewModel {
  final UiStateHolder<List<Post>> _savedPostUiStateHolder = UiStateHolder();

  UiStateHolder<List<Post>> get savedPostUiStateHolder =>
      _savedPostUiStateHolder;
  final _postLocalRepository = locator<PostLocalRepository>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_savedPostUiStateHolder];

  initViewModel() async {
    await _initViewModel();
  }

  Future _initViewModel() async {
    getPosts();
  }

  void getPosts() async {
    _savedPostUiStateHolder.updateUiState(newUiState: const UiState.loading());
    _postLocalRepository.fetchPostsStream().listen(
      (res) {
        switch (res) {
          case Success<List<Post>>():
            _savedPostUiStateHolder.updateUiState(
                newUiState: UiState<List<Post>>.viewData(data: res.data));
            break;
          case Failure<List<Post>>():
            _savedPostUiStateHolder.updateUiState(
                newUiState: UiState<List<Post>>.viewError(
                    errorMessage: res.error.toString()));
        }
      },
      onError: (error) => _savedPostUiStateHolder.updateUiState(
        newUiState:
            UiState<List<Post>>.viewError(errorMessage: AppException().message),
      ),
    );
  }
}
