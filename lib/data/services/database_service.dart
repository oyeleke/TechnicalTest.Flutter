import 'package:flutter_tech_task/data/models/post_model.dart';

import '../../objectbox.g.dart';
import '../models/post_comment_model.dart';

abstract class DatabaseService {
  Future initializeDb();

  Box<Post> getPostBox();

  Box<PostCommentModel> getPostCommentStore();
}

class DatabaseServiceImpl extends DatabaseService {
  late final Store _store;

  @override
  Box<Post> getPostBox() {
    return _store.box<Post>();
  }

  @override
  Box<PostCommentModel> getPostCommentStore() {
    return _store.box<PostCommentModel>();
  }

  @override
  Future initializeDb() async {
    _store = await openStore(directory: "app-db");
  }
}
