import 'dart:collection';

import 'package:im/src/business/bussiness_broker_stream.dart';
import 'package:im/src/business/chat_history_processor_events.dart';
import 'package:injectable/injectable.dart';

import '../ui/base/base_business_broker.dart';
import 'chat_history_business_events.dart';

@singleton
class ChatHistoryBusinessBroker
    extends BaseBusinessBroker<ChatHistoryBusinessEvents> {
  final BusinessBrokerStream brokerStream;

  final HashMap<Type, BusinessAction> actions = HashMap();

  ChatHistoryBusinessBroker(this.brokerStream) {
    actions.putIfAbsent(NewMessageAction, () => NewMessageAction(brokerStream));
  }

  void collectAndSendMessage(HashMap<String, dynamic>? params) {
    // get refrence to text box cubit || chat widget
    // send message to this cubit to get the value of edit text

    // business actions contains:
    // Apply / DoAction
    // collection of data needed by the action => message String
    // cubit work as supliers for the data
  }
}

abstract class BusinessAction {
  void apply();
}

class NewMessageAction extends BusinessAction {
  final BusinessBrokerStream businessBroker;

  String? message;

  NewMessageAction(this.businessBroker);

  @override
  void apply() {
    businessBroker.emit(SaveMessageToDataBase());
  }
}
