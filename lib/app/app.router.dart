// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/comments/post_comment_view.dart' as _i4;
import 'package:flutter_tech_task/view/home/home_view.dart' as _i2;
import 'package:flutter_tech_task/view/post/post_detail_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const homeView = '/';

  static const postDetailView = '/post-detail-view';

  static const postCommentView = '/post-comment-view';

  static const all = <String>{homeView, postDetailView, postCommentView};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.homeView, page: _i2.HomeView),
    _i1.RouteDef(Routes.postDetailView, page: _i3.PostDetailView),
    _i1.RouteDef(Routes.postCommentView, page: _i4.PostCommentView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.PostDetailView: (data) {
      final args = data.getArgs<PostDetailViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.PostDetailView(key: args.key, postId: args.postId),
        settings: data,
      );
    },
    _i4.PostCommentView: (data) {
      final args = data.getArgs<PostCommentViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.PostCommentView(key: args.key, postId: args.postId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PostDetailViewArguments {
  const PostDetailViewArguments({this.key, required this.postId});

  final _i5.Key? key;

  final int postId;

  @override
  String toString() {
    return '{"key": "$key", "postId": "$postId"}';
  }

  @override
  bool operator ==(covariant PostDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.postId == postId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ postId.hashCode;
  }
}

class PostCommentViewArguments {
  const PostCommentViewArguments({this.key, required this.postId});

  final _i5.Key? key;

  final int postId;

  @override
  String toString() {
    return '{"key": "$key", "postId": "$postId"}';
  }

  @override
  bool operator ==(covariant PostCommentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.postId == postId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ postId.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPostDetailView({
    _i5.Key? key,
    required int postId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.postDetailView,
      arguments: PostDetailViewArguments(key: key, postId: postId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPostCommentView({
    _i5.Key? key,
    required int postId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.postCommentView,
      arguments: PostCommentViewArguments(key: key, postId: postId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPostDetailView({
    _i5.Key? key,
    required int postId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.postDetailView,
      arguments: PostDetailViewArguments(key: key, postId: postId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPostCommentView({
    _i5.Key? key,
    required int postId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.postCommentView,
      arguments: PostCommentViewArguments(key: key, postId: postId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
