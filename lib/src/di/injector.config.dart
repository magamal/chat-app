// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:database_service/database_service.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business/chat_mediator.dart' as _i9;
import '../business/im_flow/send_message_flow.dart' as _i11;
import '../business/models/message_model.dart' as _i5;
import '../business/processors/databse/business_databae_processor.dart' as _i7;
import '../business/processors/databse/mappers/database_message_model_mapper.dart'
    as _i3;
import '../business/processors/databse/mappers/database_user_model_mapper.dart'
    as _i4;
import '../network/network_processor.dart' as _i6;
import '../ui/feature/chat_details/appbar/controller/im_app_bar_cubit.dart'
    as _i10;
import '../ui/feature/chat_details/bottom_edit_text/bottom_edit_text_cubit.dart'
    as _i12;
import '../ui/feature/chat_details/message_list/controller/chat_body_container_cubit.dart'
    as _i13;

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
  gh.singleton<_i3.DatabaseMessageModelMapper>(
      _i3.DatabaseMessageModelMapper());
  gh.singleton<_i4.DatabaseUserModelMapper>(_i4.DatabaseUserModelMapper());
  gh.factory<_i5.MessageModel>(() => _i5.MessageModel());
  gh.singleton<_i6.NetworkProcessor>(_i6.NetworkProcessor());
  gh.singleton<_i7.BusinessDatabaseProcessor>(_i7.BusinessDatabaseProcessor(
    gh<_i3.DatabaseMessageModelMapper>(),
    gh<_i8.DataBaseProcessor>(),
  ));
  gh.singleton<_i9.ChatMediator>(_i9.ChatMediator(
    gh<_i7.BusinessDatabaseProcessor>(),
    gh<_i6.NetworkProcessor>(),
  ));
  gh.factory<_i10.ImAppBarCubit>(
      () => _i10.ImAppBarCubit(gh<_i9.ChatMediator>()));
  gh.factory<_i11.SendMessageFlow>(() => _i11.SendMessageFlow(
        gh<_i7.BusinessDatabaseProcessor>(),
        gh<_i6.NetworkProcessor>(),
      ));
  gh.factory<_i12.BottomEditTextCubit>(
      () => _i12.BottomEditTextCubit(gh<_i9.ChatMediator>()));
  gh.factory<_i13.ChatBodyContainerCubit>(
      () => _i13.ChatBodyContainerCubit(gh<_i9.ChatMediator>()));
  return getIt;
}
