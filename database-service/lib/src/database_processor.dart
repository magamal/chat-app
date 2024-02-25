import 'package:database_service/database_service.dart';
import 'package:database_service/src/logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'base_processor.dart';

@singleton
class DataBaseProcessor implements BaseProcessor {
  Future saveMessage(DataBaseMessageModel message, DataBaseUserModel user) async {
    logDebug("Started: saveMessage");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: saveMessage");
    return "Message Saves success in database";
  }

  Future updateDataBase() async {
    logDebug("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: updateDataBase");
    return "updated success in database";
  }
}
