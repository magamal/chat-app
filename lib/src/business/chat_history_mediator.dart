import 'dart:async';
import 'dart:collection';

import 'package:im/src/database/base_processor.dart';
import 'package:im/src/ui/base/base_processor_event.dart';
import 'package:injectable/injectable.dart';

import '../database/database_processor.dart';
import '../network/network_processor.dart';

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
    final newMessageFlow = FlowConfig.create("new-message-flow")
        .triggeredBy(FlowEvent.SEND_NEW_MESSAGE)
        .addStage()
        .action(dataBaseProcessor.saveMessage)
        .endStage()
        .addStage()
        .action(updateUi)
        .action(networkProcessor.sendMessage)
        .endStage()
        .addStage()
        .action(dataBaseProcessor.updateDataBase)
        .endStage()
        .addStage()
        .action(updateUi)
        .endStage()
        .build();

    imFlows.putIfAbsent(newMessageFlow.flowEvent, () => newMessageFlow);
  }

  Future updateUi() async {
    print("Started: updating ui");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: updating ui");
  }
}

class FlowConfig {
  Stream? _flow;

  late FlowEvent _flowEvent;
  String name;
  final List<FlowStageBuilder> _stages = List.empty(growable: true);

  FlowStageBuilder? _currentStage;

  FlowConfig(this.name);

  static FlowConfig create(String name) {
    final flowConfig = FlowConfig(name);
    return flowConfig;
  }

  FlowConfig triggeredBy(FlowEvent event) {
    _flowEvent = event;
    return this;
  }

  FlowStageBuilder addStage() {
    _currentStage = FlowStageBuilder(this);
    _stages.add(_currentStage!);
    return _currentStage!;
  }

  IMFlow build() {
    Stream stream = Stream.value(1);
    for (var stage in _stages) {
      stream = stream.asyncMap((event) => stage._buildStageFuture());
    }
    return IMFlow(stream, _flowEvent);
  }
}

class FlowStageBuilder {
  List<ImAction> actions = List.empty(growable: true);
  List<ImAction> errorActions = List.empty(growable: true);
  FlowConfig flowConfig;

  FlowStageBuilder(this.flowConfig);

  FlowStageBuilder action(ImAction f) {
    actions.add(f);
    return this;
  }

  FlowStageBuilder onError(ImAction errorAction) {
    errorActions.add(errorAction);
    return this;
  }

  FlowConfig endStage() {
    return flowConfig;
  }

  Future<List<dynamic>> _buildStageFuture() async {
    try {
      return await Stream.fromFutures(actions.map((e) async => await e()))
          .toList();
    } catch (error, s) {
      return await Stream.fromFutures(errorActions.map((e) async => await e()))
          .toList();
    }
  }
}

// class IMStage {
//   apply(Stream flowStream) {
//     flowStream.zip(
//
//         ///)
//         }
// }

class IMFlow {
  final Stream stream;
  final FlowEvent flowEvent;

  IMFlow(this.stream, this.flowEvent);

  startFlow() {
    stream.listen((event) {}, onDone: () {
      print("zzzz finished IM Flow");
    });
  }
}

enum FlowEvent { SEND_NEW_MESSAGE }

typedef ImAction = Future Function();
