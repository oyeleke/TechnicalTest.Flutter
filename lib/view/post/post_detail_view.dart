import 'package:flutter/material.dart';
import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/app/app.router.dart';
import 'package:flutter_tech_task/view/post/post_save_button.dart';
import 'package:flutter_tech_task/view/post/view_models/post_detail_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../data/models/post_model.dart';
import '../../generated/l10n.dart';
import '../../utils/error_message_widget.dart';
import '../../utils/loading_widget.dart';
import '../../utils/ui_state.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostDetailViewModel>.reactive(
      viewModelBuilder: () => PostDetailViewModel(),
      onViewModelReady: (model) => model.initViewModel(postId: postId),
      builder: (context, model, _) {
        final uiState = model.postDetailUiStateHolder.uiState;
        return switch (uiState) {
          ViewData() => _PostDetailView(post: uiState.data),
          ViewError() => ErrorMessageWidget(
              message: uiState.errorMessage,
              callback: () => model.getPostDetail(postId: postId),
            ),
          Loading() => const LoadingWidget(),
        };
      },
    );
  }
}

class _PostDetailView extends StatelessWidget {
  const _PostDetailView({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.current.postDetails),
        actions: [PostSaveButton(post: post)],
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(height: 10),
            Text(post.body, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => locator<NavigationService>().navigateToPostCommentView(postId: post.id),
                  child: Text(S.current.viewComments),
                ),
              ],
            )
          ])),
    );
  }
}
