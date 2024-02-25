import 'package:im/src/business/base_processor.dart';
import 'package:im/src/utils/logger/logger.dart';
import 'package:injectable/injectable.dart';

import '../business/im_flow/im_base_flow.dart';

@singleton
class DataBaseProcessor implements BaseProcessor {

  Future saveMessage(List<ActionResult>? lastActionResult) async {
    logDebug("Started: saveMessage");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: saveMessage");
    return "Message Saves success in database";
  }

  Future updateDataBase(List<ActionResult>? lastActionResult) async {
    logDebug("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: updateDataBase");
    return "updated success in database";
  }
}
