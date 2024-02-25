import 'package:im/src/business/base_mediator/base_mediator.dart';
import 'package:im/src/business/im_flow/send_message_flow.dart';
import 'package:im/src/business/processors/databse/business_databae_processor.dart';
import 'package:injectable/injectable.dart';

import '../network/network_processor.dart';

@singleton
class ChatMediator extends BaseMediator {
  final BusinessDatabaseProcessor dataBaseProcessor;
  final NetworkProcessor networkProcessor;

  ChatMediator(this.dataBaseProcessor, this.networkProcessor);

  @override
  void initFlows() {
    _initSendMessageFlow();
  }

  void _initSendMessageFlow() {
    attachFlow(SendMessageFlow);
  }
}
