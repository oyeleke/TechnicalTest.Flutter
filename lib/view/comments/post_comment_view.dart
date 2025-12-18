import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/comments/post_comment_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../generated/l10n.dart';
import '../../utils/error_message_widget.dart';
import '../../utils/loading_widget.dart';
import '../../utils/ui_state.dart';

class PostCommentView extends StatelessWidget {
  const PostCommentView({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostCommentViewModel>.reactive(
      viewModelBuilder: () => PostCommentViewModel(),
      onViewModelReady: (model) => model.initViewModel(postId: postId),
      builder: (context, model, _) {
        final uiState = model.postCommentUiStateHolder.uiState;
        return Scaffold(
          appBar: AppBar(
            title:  Text(S.current.comments),
          ),
          body: switch (uiState) {
            ViewData() => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(uiState.data[index].name),
                    subtitle: Text(uiState.data[index].body),
                  ),
                  itemCount: uiState.data.length,
                ),
              ),
            ViewError() => ErrorMessageWidget(
                message: uiState.errorMessage,
                callback: () => model.getPostComments(postId: postId),
              ),
            Loading() => const LoadingWidget(),
          },
        );
      },
    );
  }
}
