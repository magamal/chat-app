// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../database_processor.dart' as _i4;
import '../model/database_message_model.dart' as _i3;
import '../model/database_user_model.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initModuleGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i4.DataBaseProcessor>(_i4.DataBaseProcessor());
  return getIt;
}
