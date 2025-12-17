// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UiState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UiState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UiState<$T>()';
  }
}

/// @nodoc
class $UiStateCopyWith<T, $Res> {
  $UiStateCopyWith(UiState<T> _, $Res Function(UiState<T>) __);
}

/// Adds pattern-matching-related methods to [UiState].
extension UiStatePatterns<T> on UiState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewData<T> value)? viewData,
    TResult Function(ViewError<T> value)? viewError,
    TResult Function(Loading<T> value)? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ViewData() when viewData != null:
        return viewData(_that);
      case ViewError() when viewError != null:
        return viewError(_that);
      case Loading() when loading != null:
        return loading(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewData<T> value) viewData,
    required TResult Function(ViewError<T> value) viewError,
    required TResult Function(Loading<T> value) loading,
  }) {
    final _that = this;
    switch (_that) {
      case ViewData():
        return viewData(_that);
      case ViewError():
        return viewError(_that);
      case Loading():
        return loading(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewData<T> value)? viewData,
    TResult? Function(ViewError<T> value)? viewError,
    TResult? Function(Loading<T> value)? loading,
  }) {
    final _that = this;
    switch (_that) {
      case ViewData() when viewData != null:
        return viewData(_that);
      case ViewError() when viewError != null:
        return viewError(_that);
      case Loading() when loading != null:
        return loading(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? viewData,
    TResult Function(String errorMessage)? viewError,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ViewData() when viewData != null:
        return viewData(_that.data);
      case ViewError() when viewError != null:
        return viewError(_that.errorMessage);
      case Loading() when loading != null:
        return loading();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) viewData,
    required TResult Function(String errorMessage) viewError,
    required TResult Function() loading,
  }) {
    final _that = this;
    switch (_that) {
      case ViewData():
        return viewData(_that.data);
      case ViewError():
        return viewError(_that.errorMessage);
      case Loading():
        return loading();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? viewData,
    TResult? Function(String errorMessage)? viewError,
    TResult? Function()? loading,
  }) {
    final _that = this;
    switch (_that) {
      case ViewData() when viewData != null:
        return viewData(_that.data);
      case ViewError() when viewError != null:
        return viewError(_that.errorMessage);
      case Loading() when loading != null:
        return loading();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ViewData<T> implements UiState<T> {
  const ViewData({required this.data});

  final T data;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewDataCopyWith<T, ViewData<T>> get copyWith =>
      _$ViewDataCopyWithImpl<T, ViewData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'UiState<$T>.viewData(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ViewDataCopyWith<T, $Res>
    implements $UiStateCopyWith<T, $Res> {
  factory $ViewDataCopyWith(
          ViewData<T> value, $Res Function(ViewData<T>) _then) =
      _$ViewDataCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ViewDataCopyWithImpl<T, $Res> implements $ViewDataCopyWith<T, $Res> {
  _$ViewDataCopyWithImpl(this._self, this._then);

  final ViewData<T> _self;
  final $Res Function(ViewData<T>) _then;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ViewData<T>(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ViewError<T> implements UiState<T> {
  const ViewError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewErrorCopyWith<T, ViewError<T>> get copyWith =>
      _$ViewErrorCopyWithImpl<T, ViewError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewError<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'UiState<$T>.viewError(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ViewErrorCopyWith<T, $Res>
    implements $UiStateCopyWith<T, $Res> {
  factory $ViewErrorCopyWith(
          ViewError<T> value, $Res Function(ViewError<T>) _then) =
      _$ViewErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ViewErrorCopyWithImpl<T, $Res> implements $ViewErrorCopyWith<T, $Res> {
  _$ViewErrorCopyWithImpl(this._self, this._then);

  final ViewError<T> _self;
  final $Res Function(ViewError<T>) _then;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ViewError<T>(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Loading<T> implements UiState<T> {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UiState<$T>.loading()';
  }
}

// dart format on
