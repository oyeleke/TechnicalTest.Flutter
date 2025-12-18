import 'package:flutter_tech_task/app/app.locator.dart';
import 'package:flutter_tech_task/data/repositories/posts_repository/post_local_repository.dart';
import 'package:flutter_tech_task/usecases/save_post_usecase.dart';
import 'package:mockito/annotations.dart';

import '../repository_mocks/post_local_repository_mock.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SavePostUseCase>(onMissingStub: OnMissingStub.returnDefault),
])
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

PostLocalRepository getAndRegisterPostLocalRepository() {
  _removeRegistrationIfExists<PostLocalRepositoryImpl>();
  final service = PostLocalRepositoryMock();
  locator.registerLazySingleton<PostLocalRepository>(() => service);
  return service;
}

SavePostUseCase getAndRegisterSavePostUseCase() {
  _removeRegistrationIfExists<SavePostUseCase>();
  final useCase = MockSavePostUseCase();
  locator.registerLazySingleton<SavePostUseCase>(() => useCase);
  return useCase;
}

void registerServices() {
  getAndRegisterPostLocalRepository();
  getAndRegisterSavePostUseCase();
}

void unregisterServices() {
  locator.unregister<PostLocalRepository>();
  locator.unregister<SavePostUseCase>();
}
