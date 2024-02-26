import 'package:database_service/test_database_processor.dart';
import 'package:im/src/business/im_flow/im_base_flow_mediator_container.dart';
import 'package:injectable/injectable.dart';

import '../../database/database_processor.dart';
import '../../network/network_processor.dart';
import '../chat_mediator.dart';
import 'im_base_flow.dart';

@injectable
class SendMessageFlow extends ImBaseFlowMediatorContainer {
  final NetworkProcessor _networkProcessor;
  final TestDatabaseProcessor testDatabaseProcessor;

  SendMessageFlow(this._networkProcessor, this.testDatabaseProcessor);

  @override
  IMFlow buildFlow(Map<String, dynamic> parameters) {
    /** send message flow
     * 1- save in data base
     * 2.1 update ui
     * 2.2 send request
     * 3 update database
     * 4 update ui
     */
    return FlowConfig.create("new-message-flow")
        .triggeredBy(getFlowEvent())
        .addStage()
        .action("saveMessage", saveMessage)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .action("sendMessage", _networkProcessor.sendMessage)
        .endStage()
        .addStage()
        .action("updateDataBase", updateDatabaseMessage)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .endStage()
        .build();
  }

  @override
  FlowEvent getFlowEvent() => FlowEvent.SEND_NEW_MESSAGE;

  Future updateUi(List<ActionResult>? lastActionResult) async {}

  Future saveMessage(List<ActionResult>? lastActionResult) async {
    testDatabaseProcessor.saveMessage();
  }

  Future updateDatabaseMessage(List<ActionResult>? lastActionResult) async {
    testDatabaseProcessor.updateDataBase();
  }
}

extension SendMessageFlowExtensions on ChatMediator {
  addMessage() {
    startFlow(FlowEvent.SEND_NEW_MESSAGE, {"messageText": "Hellooooo"});
  }
}
