// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business/bussiness_broker_stream.dart' as _i3;
import '../business/chat_history_business_broker.dart' as _i5;
import '../business/chat_history_mediator.dart' as _i4;
import '../database/database_processor.dart' as _i6;
import '../network/network_processor.dart' as _i8;
import '../ui/feature/chat_details/appbar/controller/im_app_bar_cubit.dart'
    as _i7;
import '../ui/feature/chat_details/bottom_edit_text/bottom_edit_text_cubit.dart'
    as _i9;
import '../ui/feature/chat_details/message_list/controller/chat_body_container_cubit.dart'
    as _i10;

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
  gh.singleton<_i3.BusinessBrokerStream>(_i3.BusinessBrokerStream());
  gh.singleton<_i4.CharHistoryMediator>(_i4.CharHistoryMediator());
  gh.singleton<_i5.ChatHistoryBusinessBroker>(
      _i5.ChatHistoryBusinessBroker(gh<_i3.BusinessBrokerStream>()));
  gh.singleton<_i6.DataBaseProcessor>(
      _i6.DataBaseProcessor(gh<_i3.BusinessBrokerStream>()));
  gh.factory<_i7.ImAppBarCubit>(
      () => _i7.ImAppBarCubit(gh<_i4.CharHistoryMediator>()));
  gh.singleton<_i8.NetworkProcessor>(
      _i8.NetworkProcessor(gh<_i3.BusinessBrokerStream>()));
  gh.factory<_i9.BottomEditTextCubit>(
      () => _i9.BottomEditTextCubit(gh<_i5.ChatHistoryBusinessBroker>()));
  gh.factory<_i10.ChatBodyContainerCubit>(
      () => _i10.ChatBodyContainerCubit(gh<_i5.ChatHistoryBusinessBroker>()));
  return getIt;
}
