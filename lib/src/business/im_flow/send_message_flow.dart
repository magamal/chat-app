import 'package:im/src/business/im_flow/im_base_flow_mediator_container.dart';
import 'package:injectable/injectable.dart';

import '../../database/database_processor.dart';
import '../../network/network_processor.dart';
import '../chat_mediator.dart';
import 'im_base_flow.dart';

@injectable
class SendMessageFlow extends ImBaseFlowMediatorContainer {
  final DataBaseProcessor _dataBaseProcessor;
  final NetworkProcessor _networkProcessor;

  SendMessageFlow(this._dataBaseProcessor, this._networkProcessor);

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
        .action("saveMessage", _dataBaseProcessor.saveMessage)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .action("sendMessage", _networkProcessor.sendMessage)
        .endStage()
        .addStage()
        .action("updateDataBase", _dataBaseProcessor.updateDataBase)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .endStage()
        .build();
  }

  @override
  FlowEvent getFlowEvent() => FlowEvent.SEND_NEW_MESSAGE;

  Future updateUi(List<ActionResult>? lastActionResult) async {}
}

extension SendMessageFlowExtensions on ChatMediator {
  addMessage() {
    imFlows[FlowEvent.SEND_NEW_MESSAGE]
        ?.startFlow({"messageText": "Hellooooo"});
  }
}
