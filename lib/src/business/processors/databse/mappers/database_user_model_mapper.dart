import 'package:database_service/database_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/injector.dart';
import '../../../models/user_model.dart';

@injectable
class DatabaseUserModelMapper {
  DataBaseUserModel? mapToDataBase(UserModel? model) {
    return DataBaseUserModel();
  }

  UserModel? mapFromDataBase(DataBaseUserModel? model) {
    return UserModel();
  }
}

extension DatabaseUserModelMapperExtensions on DataBaseUserModel {
  mapToBusinessModel() {
    return getIt<DatabaseUserModelMapper>().mapFromDataBase(this);
  }
}

extension BusinessUserModelMapperExtensions on UserModel {
  mapToDataBaseModel() {
    return getIt<DatabaseUserModelMapper>().mapToDataBase(this);
  }
}
