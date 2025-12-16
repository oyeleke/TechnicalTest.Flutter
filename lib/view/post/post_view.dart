import 'package:flutter/material.dart';
import 'package:flutter_tech_task/view/post/post_view_model.dart';
import 'package:stacked/stacked.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: ()=> PostViewModel(),
      onViewModelReady: (model) => model.initViewModel(),
      builder: (context, model, _) => const Placeholder(),
    );  }
}
