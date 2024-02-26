import 'package:im/src/business/base_mediator/base_mediator.dart';
import 'package:im/src/business/im_flow/send_message_flow.dart';
import 'package:injectable/injectable.dart';

import '../database/database_processor.dart';
import '../network/network_processor.dart';
import 'im_flow/im_base_flow.dart';

@singleton
class ChatMediator extends BaseMediator {
  @override
  void initFlows() {
    _initSendMessageFlow();
  }

  void _initSendMessageFlow() {
    attachFlow(SendMessageFlow);
  }
}
