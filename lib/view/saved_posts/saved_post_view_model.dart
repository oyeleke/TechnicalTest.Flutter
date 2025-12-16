import 'package:stacked/stacked.dart';

class SavedPostViewModel extends BaseViewModel{

  initViewModel() async {
    await runBusyFuture(_initViewModel());
  }

  Future _initViewModel() async {}

}