import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injector.config.dart';

@InjectableInit(
  initializerName: r'$initModuleGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependenciesForDatabaseModule(
    GetIt getIt) async {
  await $initModuleGetIt(getIt);
  // if (environment == Environment.test) {
  //   logger.d("testing env");
  //   inject<Dio>(instanceName: "dio_client").interceptors.requestLock.lock();
  //   getIt.allowReassignment = true;
  // }
}
