import 'package:database_service/database_service.dart';
import 'package:im/src/business/im_flow/im_base_flow_mediator_container.dart';
import 'package:im/src/business/models/message_model.dart';
import 'package:im/src/business/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../network/network_processor.dart';
import '../chat_mediator.dart';
import '../processors/databse/mappers/database_message_model_mapper.dart';
import '../processors/databse/business_databae_processor.dart';
import 'im_base_flow.dart';

@injectable
class SendMessageFlow extends ImBaseFlowMediatorContainer {
  final BusinessDatabaseProcessor _dataBaseProcessor;
  final NetworkProcessor _networkProcessor;
  //final DatabaseMessageModelMapper databaseMessageModelMapper;

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
        .action("saveMessage", saveMessageToDatabase)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .action("sendMessage", sendMessageToServer)
        .endStage()
        .addStage()
        .action("updateDataBase", saveMessageToDatabase)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .endStage()
        .build();
  }

  @override
  FlowEvent getFlowEvent() => FlowEvent.SEND_NEW_MESSAGE;

  Future updateUi(List<ActionResult>? lastActionResult) async {}

  Future saveMessageToDatabase(List<ActionResult>? actionResults) async {
    final message = MessageModel();
    final recepient = UserModel();
    _dataBaseProcessor.saveMessage(message,recepient);
  }

  Future sendMessageToServer(List<ActionResult>? actionResults) async {}
}

extension SendMessageFlowExtensions on ChatMediator {
  addMessage() {
    imFlows[FlowEvent.SEND_NEW_MESSAGE]
        ?.startFlow({"messageText": "Hellooooo"});
  }
}
