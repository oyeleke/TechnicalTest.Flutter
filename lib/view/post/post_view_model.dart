import 'package:stacked/stacked.dart';

class PostViewModel extends BaseViewModel {
  initViewModel() async {
    await runBusyFuture(_initViewModel());
  }

  Future _initViewModel() async {}
}
