import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/usecases/save_post_usecase.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_tech_task/utils/ui_state.dart';
import 'package:flutter_tech_task/utils/ui_state_holder.dart';
import 'package:stacked/stacked.dart';

class PostSaveButtonViewModel extends ReactiveViewModel {
  final UiStateHolder<bool> _postSaveButtonStateHolder = UiStateHolder();

  UiStateHolder<bool> get postSaveButtonStateHolder =>
      _postSaveButtonStateHolder;
  final _postLocalRepository = locator<PostLocalRepository>();
  final _savePostUseCase = locator<SavePostUseCase>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_postSaveButtonStateHolder];

  initViewModel({required int postId}) async {
    await _initViewModel(postId: postId);
  }

  Future _initViewModel({required int postId}) async {
    getIsButtonSaved(postId: postId);
  }

  void getIsButtonSaved({required int postId}) async {
    final res = await _postLocalRepository.isPostSaved(postId: postId);
    switch (res) {
      case Success():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewData(data: res.data));
        break;
      case Failure():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewError(errorMessage: res.error.toString()));
    }
  }

  void savePost({required Post post}) async {
    final res = await _savePostUseCase.savePostAndComments(post: post);
    switch (res) {
      case Success():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewData(data: res.data));
        break;
      case Failure():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewError(errorMessage: res.error.toString()));
    }
  }

  void deletePost({required Post post}) async {
    final res = await _savePostUseCase.deletePostAndComments(postId: post.id);
    switch (res) {
      case Success():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewData(data: res.data));
        break;
      case Failure():
        _postSaveButtonStateHolder.updateUiState(
            newUiState: UiState.viewError(errorMessage: res.error.toString()));
    }
  }
}
