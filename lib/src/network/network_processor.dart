import 'package:im/src/business/base_processor.dart';
import 'package:im/src/utils/logger/logger.dart';
import 'package:injectable/injectable.dart';

import '../business/im_flow/im_base_flow.dart';

@singleton
class NetworkProcessor extends BaseProcessor {
  Future sendMessage(List<ActionResult>? lastActionResult) async {
    logDebug("Started: sendMessage");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: sendMessage");
  }
}
