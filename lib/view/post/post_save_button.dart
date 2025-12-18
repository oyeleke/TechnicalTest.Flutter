import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/post/view_models/post_save_button_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../data/models/post_model.dart';
import '../../utils/ui_state.dart';

class PostSaveButton extends StatelessWidget {
  const PostSaveButton({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostSaveButtonViewModel>.reactive(
      viewModelBuilder: () => PostSaveButtonViewModel(),
      onViewModelReady: (model) => model.initViewModel(postId: post.id),
      builder: (context, model, _) {
        final uiState = model.postSaveButtonStateHolder.uiState;
        return switch (uiState) {
          ViewData() => uiState.data
              ? IconButton(
                  icon: const Icon(Icons.bookmark, color: Colors.black),
                  onPressed: () {
                    model.deletePost(post: post);
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    model.savePost(post: post);
                  }),
          ViewError() => const SizedBox.shrink(),
          Loading() => const SizedBox.shrink(),
        };
      },
    );
  }
}
