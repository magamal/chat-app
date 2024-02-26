import 'package:database_service/di/injector.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  await configureDependenciesForDatabaseModule(getIt);
  await $initGetIt(getIt);
  // if (environment == Environment.test) {
  //   logger.d("testing env");
  //   inject<Dio>(instanceName: "dio_client").interceptors.requestLock.lock();
  //   getIt.allowReassignment = true;
  // }
}

T inject<T extends Object>({String? instanceName}) {
  return getIt.get<T>(instanceName: instanceName);
}
