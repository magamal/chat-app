// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/chat_details/appbar/controller/im_app_bar_cubit.dart' as _i5;
import '../feature/chat_details/business/chat_history_business_broker.dart'
    as _i4;
import '../feature/chat_details/chat_body_container/controller/chat_body_container_cubit.dart'
    as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ChatBodyContainerCubit>(
      () => _i3.ChatBodyContainerCubit(gh<dynamic>()));
  gh.singleton<_i4.ChatHistoryBusinessBroker>(_i4.ChatHistoryBusinessBroker());
  gh.factory<_i5.ImAppBarCubit>(() => _i5.ImAppBarCubit(gh<dynamic>()));
  return getIt;
}
