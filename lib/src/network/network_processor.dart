import 'package:im/src/business/chat_history_processor_events.dart';
import 'package:im/src/database/base_processor.dart';
import 'package:injectable/injectable.dart';

import '../business/bussiness_broker_stream.dart';
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
    print("send Message in HTTP Request");
    brokerStream.emit(event);
  }

  Future sendMessage() async {
    print("Started: sendMessage");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: sendMessage");
  }
}
