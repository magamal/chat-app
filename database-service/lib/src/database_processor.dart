import 'package:database_service/src/logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'base_processor.dart';
import 'model/db_action_result.dart';

@singleton
class DataBaseProcessor implements BaseProcessor {

  Future saveMessage(List<DbActionResult>? lastActionResult) async {
    logDebug("Started: saveMessage");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: saveMessage");
    return "Message Saves success in database";
  }

  Future updateDataBase(List<DbActionResult>? lastActionResult) async {
    logDebug("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: updateDataBase");
    return "updated success in database";
  }
}
