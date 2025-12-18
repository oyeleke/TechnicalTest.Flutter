import 'package:flutter_tech_task/view/comments/post_comment_view.dart';
import 'package:flutter_tech_task/view/home/home_view.dart';
import 'package:flutter_tech_task/view/post/post_detail_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data/repositories/post_comment_repository/post_comment_local_repository.dart';
import '../data/repositories/post_comment_repository/post_comment_remote_repository.dart';
import '../data/repositories/posts_repository/post_local_repository.dart';
import '../data/repositories/posts_repository/post_remote_repository.dart';
import '../data/services/api_service.dart';
import '../data/services/database_service.dart';
import '../usecases/save_post_usecase.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: PostDetailView),
    MaterialRoute(page: PostCommentView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: DatabaseServiceImpl, asType: DatabaseService),
    LazySingleton(
        classType: PostRemoteRepositoryImpl, asType: PostRemoteRepository),
    LazySingleton(
        classType: PostLocalRepositoryImpl, asType: PostLocalRepository),
    LazySingleton(
        classType: PostCommentRemoteRepositoryImpl,
        asType: PostCommentRemoteRepository),
    LazySingleton(
        classType: PostCommentLocalRepositoryImpl,
        asType: PostCommentLocalRepository),
    LazySingleton(classType: SavePostUseCase)
  ],
)
class AppSetup {}
