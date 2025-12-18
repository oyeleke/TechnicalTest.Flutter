// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../data/repositories/post_comment_repository/post_comment_local_repository.dart';
import '../data/repositories/post_comment_repository/post_comment_remote_repository.dart';
import '../data/repositories/posts_repository/post_local_repository.dart';
import '../data/repositories/posts_repository/post_remote_repository.dart';
import '../data/services/api_service.dart';
import '../data/services/database_service.dart';
import '../usecases/save_post_usecase.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
  locator.registerLazySingleton<PostRemoteRepository>(
      () => PostRemoteRepositoryImpl());
  locator.registerLazySingleton<PostLocalRepository>(
      () => PostLocalRepositoryImpl());
  locator.registerLazySingleton<PostCommentRemoteRepository>(
      () => PostCommentRemoteRepositoryImpl());
  locator.registerLazySingleton<PostCommentLocalRepository>(
      () => PostCommentLocalRepositoryImpl());
  locator.registerLazySingleton(() => SavePostUseCase());
}
