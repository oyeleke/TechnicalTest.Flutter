import 'package:stacked/stacked_annotations.dart';

import '../data/repositories/post_comment_repository/post_comment_remote_repository.dart';
import '../data/repositories/posts_repository/post_local_repository.dart';
import '../data/repositories/posts_repository/post_remote_repository.dart';
import '../data/services/api_service.dart';
import '../data/services/database_service.dart';

@StackedApp(
  routes: [],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: DatabaseServiceImpl, asType: DatabaseService),
    LazySingleton(
        classType: PostRemoteRepositoryImpl, asType: PostRemoteRepository),
    LazySingleton(
        classType: PostLocalRepositoryImpl, asType: PostLocalRepository),
    LazySingleton(
        classType: PostCommentRemoteRepositoryImpl,
        asType: PostCommentRemoteRepository)
  ],
)
class AppSetup {}
