import 'package:im/src/business/chat_history_processor_events.dart';
import 'package:im/src/database/base_processor.dart';
import 'package:im/src/utils/logger/logger.dart';
import 'package:injectable/injectable.dart';

import '../business/bussiness_broker_stream.dart';
import '../business/im_flow/im_base_flow.dart';
import '../ui/base/base_processor_event.dart';

@singleton
class NetworkProcessor extends BaseProcessor {
  final BusinessBrokerStream brokerStream;

  NetworkProcessor(this.brokerStream) {
    _setupStreamListener();
  }

  void _setupStreamListener() {
    brokerStream.subscribe(MessageSavedToDatabaseSuccess(), this);
  }

  @override
  notify(BaseProcessorEvent event) {
    switch (event) {
      case MessageSavedToDatabaseSuccess():
        onMessageSavedToDatabaseSuccess(event);
    }
  }

  void onMessageSavedToDatabaseSuccess(MessageSavedToDatabaseSuccess event) {
    logDebug("send Message in HTTP Request");
    brokerStream.emit(event);
  }

  Future sendMessage(List<ActionResult>? lastActionResult) async {
    logDebug("Started: sendMessage");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: sendMessage");
  }
}
