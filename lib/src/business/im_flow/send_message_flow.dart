import 'package:injectable/injectable.dart';

import '../../database/database_processor.dart';
import '../../network/network_processor.dart';
import 'im_base_flow.dart';

@injectable
class SendMessageFlow {
  final DataBaseProcessor dataBaseProcessor;
  final NetworkProcessor networkProcessor;

  late IMFlow flow;

  SendMessageFlow(this.dataBaseProcessor, this.networkProcessor) {
    _initFlow();
  }

  void _initFlow() {
    /** send message flow
     * 1- save in data base
     * 2.1 update ui
     * 2.2 send request
     * 3 update database
     * 4 update ui
     */
    flow = FlowConfig.create("new-message-flow")
        .triggeredBy(FlowEvent.SEND_NEW_MESSAGE)
        .addStage()
        .action("saveMessage", dataBaseProcessor.saveMessage)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .action("sendMessage", networkProcessor.sendMessage)
        .endStage()
        .addStage()
        .action("updateDataBase", dataBaseProcessor.updateDataBase)
        .endStage()
        .addStage()
        .action("updateUi", updateUi)
        .endStage()
        .build();
  }

  Future updateUi(List<ActionResult>? lastActionResult) async {
    print("Started: updating ui");
    lastActionResult?.forEach((action) {
      // print("updateDataBase: actionName:  ${action.actionName} || result ${action.result}");
    });
    await Future.delayed(Duration(seconds: 1));
    print("Finished: updating ui");
  }
}
