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
import '../business/chat_history_business_broker.dart' as _i4;
import '../business/chat_history_mediator.dart' as _i9;
import '../business/im_flow/send_message_flow.dart' as _i7;
import '../database/database_processor.dart' as _i5;
import '../network/network_processor.dart' as _i6;
import '../ui/feature/chat_details/appbar/controller/im_app_bar_cubit.dart'
    as _i11;
import '../ui/feature/chat_details/bottom_edit_text/bottom_edit_text_cubit.dart'
    as _i8;
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
  gh.singleton<_i4.ChatHistoryBusinessBroker>(
      _i4.ChatHistoryBusinessBroker(gh<_i3.BusinessBrokerStream>()));
  gh.singleton<_i5.DataBaseProcessor>(
      _i5.DataBaseProcessor(gh<_i3.BusinessBrokerStream>()));
  gh.singleton<_i6.NetworkProcessor>(
      _i6.NetworkProcessor(gh<_i3.BusinessBrokerStream>()));
  gh.factory<_i7.SendMessageFlow>(() => _i7.SendMessageFlow(
        gh<_i5.DataBaseProcessor>(),
        gh<_i6.NetworkProcessor>(),
      ));
  gh.factory<_i8.BottomEditTextCubit>(
      () => _i8.BottomEditTextCubit(gh<_i4.ChatHistoryBusinessBroker>()));
  gh.singleton<_i9.CharHistoryMediator>(_i9.CharHistoryMediator(
    gh<_i5.DataBaseProcessor>(),
    gh<_i6.NetworkProcessor>(),
  ));
  gh.factory<_i10.ChatBodyContainerCubit>(
      () => _i10.ChatBodyContainerCubit(gh<_i4.ChatHistoryBusinessBroker>()));
  gh.factory<_i11.ImAppBarCubit>(
      () => _i11.ImAppBarCubit(gh<_i9.CharHistoryMediator>()));
  return getIt;
}
