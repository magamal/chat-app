import 'dart:collection';

import 'package:im/src/business/im_flow/send_message_flow.dart';
import 'package:im/src/database/base_processor.dart';
import 'package:im/src/di/injector.dart';
import 'package:im/src/ui/base/base_processor_event.dart';
import 'package:injectable/injectable.dart';

import '../database/database_processor.dart';
import '../network/network_processor.dart';
import 'im_flow/im_base_flow.dart';

@singleton
class CharHistoryMediator {
  final HashMap<FlowEvent, IMFlow> imFlows = HashMap();

  final HashMap<BaseProcessorEvent, List<BaseProcessor>> brokerSubscribers =
      HashMap();

  final DataBaseProcessor dataBaseProcessor;
  final NetworkProcessor networkProcessor;

  CharHistoryMediator(this.dataBaseProcessor, this.networkProcessor) {
    _initSendMessageFlow();
  }

  addMessage() async {
    imFlows[FlowEvent.SEND_NEW_MESSAGE]?.startFlow();
  }

  notify(BaseProcessorEvent event) {
    brokerSubscribers[event]?.forEach((processor) {
      processor.notify(event);
    });
  }

  emit(BaseProcessorEvent event) {
    notify(event);
  }

  void _initSendMessageFlow() {
    /** send message flow
     * 1- save in data base
     * 2.1 update ui
     * 2.2 send request
     * 3 update database
     * 4 update ui
     */
    final newMessageFlow = getIt<SendMessageFlow>();

    imFlows.putIfAbsent(
        newMessageFlow.flow.flowEvent, () => newMessageFlow.flow);
  }
}
