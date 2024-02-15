import 'package:im/src/business/bussiness_broker_stream.dart';
import 'package:im/src/business/chat_history_processor_events.dart';
import 'package:im/src/database/base_processor.dart';
import 'package:im/src/database/database_stream.dart';
import 'package:im/src/ui/base/base_processor_event.dart';
import 'package:injectable/injectable.dart';

@singleton
class DataBaseProcessor implements BaseProcessor {
  final BusinessBrokerStream brokerStream;

  DataBaseProcessor(this.brokerStream) {
    _setupStreamListener();
  }

  void _setupStreamListener() {
    brokerStream.subscribe(SaveMessageToDataBase(), this);
    brokerStream.subscribe(MessageSentToServerSuccess(), this);
  }

  @override
  notify(BaseProcessorEvent event) {
    switch (event) {
      case SaveMessageToDataBase():
        onSaveMessageToDataBseEvent(event);
        break;
      case MessageSentToServerSuccess():
        onMessageSentToServerSuccess(event);
        break;
    }
  }

  void onSaveMessageToDataBseEvent(SaveMessageToDataBase event) {
    print("Message saved to Data Base");
    brokerStream.emit(MessageSavedToDatabaseSuccess());
  }

  void onMessageSentToServerSuccess(MessageSentToServerSuccess event) {
    print("update state of send message");
    brokerStream.emit(MessageUpdate());
  }

  Future saveMessage() async {
    print("Started: saveMessage");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: saveMessage");
  }

  Future updateDataBase() async {
    print("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: updateDataBase");
  }
}
