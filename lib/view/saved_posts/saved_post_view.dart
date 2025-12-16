import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/saved_posts/saved_post_view_model.dart';
import 'package:stacked/stacked.dart';

class SavedPostView extends StatelessWidget {
  const SavedPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedPostViewModel>.reactive(
      viewModelBuilder: ()=> SavedPostViewModel(),
      onViewModelReady: (model) => model.initViewModel(),
      builder: (context, model, _) => const Placeholder(),
    );
  }
}
