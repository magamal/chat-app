import 'package:database_service/database_service.dart';
import 'package:im/src/business/models/message_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/injector.dart';

@singleton
class DatabaseMessageModelMapper {
  DataBaseMessageModel? mapToDataBase(MessageModel? model) {
    return DataBaseMessageModel();
  }

  MessageModel? mapFromDataBase(DataBaseMessageModel? model) {
    return MessageModel();
  }
}

extension DatabaseMessageModelMapperExtensions on DataBaseMessageModel {
  mapToBusinessModel() {
    return getIt<DatabaseMessageModelMapper>().mapFromDataBase(this);
  }
}

extension BusinessMessageModelMapperExtensions on MessageModel {
  mapToDataBaseModel() {
    return getIt<DatabaseMessageModelMapper>().mapToDataBase(this);
  }
}
