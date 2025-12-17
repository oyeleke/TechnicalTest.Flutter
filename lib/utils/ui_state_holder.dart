import 'package:flutter_tech_task/utils/ui_state.dart';
import 'package:stacked/stacked.dart';

class UiStateHolder<T> with ListenableServiceMixin {
  ReactiveValue<UiState<T>> _uiState = ReactiveValue(UiState.loading());

  UiState<T> get uiState => _uiState.value;

  UiStateHolder() {
    listenToReactiveValues([_uiState]);
  }

  void updateUiState({required UiState<T> newUiState}) {
    _uiState = ReactiveValue(newUiState);
    notifyListeners();
  }
}
