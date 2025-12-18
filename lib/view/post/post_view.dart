import 'package:flutter/material.dart';
import 'package:flutter_tech_task/utils/error_message_widget.dart';
import 'package:flutter_tech_task/utils/ui_state.dart';
import 'package:flutter_tech_task/view/post/post_item.dart';
import 'package:flutter_tech_task/view/post/view_models/post_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../utils/loading_widget.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(),
      onViewModelReady: (model) => model.initViewModel(),
      builder: (context, model, _) {
        final uiState = model.postUiStateHolder.uiState;
        return switch (uiState) {
          ViewData() => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  itemBuilder: (context, index) => PostItem(
                        post: uiState.data[index],
                      ),
                  itemCount: uiState.data.length),
            ),
          ViewError() => ErrorMessageWidget(
              message: uiState.errorMessage,
              callback: () => model.getPosts,
            ),
          Loading() => const LoadingWidget(),
        };
      },
    );
  }
}
