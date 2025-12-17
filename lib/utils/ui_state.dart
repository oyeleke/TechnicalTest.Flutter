import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
sealed class UiState<T> with _$UiState<T> {

  const factory UiState.viewData({required T data}) = ViewData<T>;

  const factory UiState.viewError({required String errorMessage}) =
  ViewError<T>;

  const factory UiState.loading() =
  Loading<T>;

}