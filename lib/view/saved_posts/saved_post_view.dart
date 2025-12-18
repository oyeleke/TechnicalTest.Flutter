import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/saved_posts/saved_post_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../utils/error_message_widget.dart';
import '../../utils/loading_widget.dart';
import '../../utils/ui_state.dart';
import '../post/post_item.dart';

class SavedPostView extends StatelessWidget {
  const SavedPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedPostViewModel>.reactive(
      viewModelBuilder: () => SavedPostViewModel(),
      onViewModelReady: (model) => model.initViewModel(),
      builder: (context, model, _) {
        final uiState = model.savedPostUiStateHolder.uiState;
        return switch (uiState) {
          ViewData() => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: uiState.data.isEmpty
                  ? const ErrorMessageWidget(
                      message: "No saved Posts",
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => PostItem(
                            post: uiState.data[index],
                          ),
                      itemCount: uiState.data.length),
            ),
          ViewError() => ErrorMessageWidget(
              message: uiState.errorMessage,
            ),
          Loading() => const LoadingWidget(),
        };
      },
    );
  }
}
