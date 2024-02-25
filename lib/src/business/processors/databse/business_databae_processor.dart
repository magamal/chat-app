import 'package:database_service/database_service.dart';
import 'package:im/src/business/processors/databse/mappers/database_message_model_mapper.dart';
import 'package:im/src/business/models/message_model.dart';
import 'package:im/src/business/models/user_model.dart';
import 'package:im/src/business/processors/databse/mappers/database_user_model_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class BusinessDatabaseProcessor {
  final DatabaseMessageModelMapper messageMapper;
  final DataBaseProcessor processor;

  BusinessDatabaseProcessor(this.messageMapper, this.processor);

  Future saveMessage(MessageModel message, UserModel user) async {
    return processor.saveMessage(
        message.mapToDataBaseModel(), user.mapToDataBaseModel());
  }
}
