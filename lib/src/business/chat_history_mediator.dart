import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:im/main.dart';
import 'package:im/src/business/chat_history_business_broker.dart';
import 'package:im/src/database/base_processor.dart';
import 'package:im/src/ui/base/base_processor_event.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../ui/feature/chat_details/bottom_edit_text/bottom_edit_text_cubit.dart';

@singleton
class CharHistoryMediator {
  final HashMap<BaseProcessorEvent, List<BaseProcessor>> brokerSubscribers =
      HashMap();

  config() {
    Seq
    final newMessageFlow = FlowConfig.create("new-message-flow")
        .triggeredBy(FlowEvent.SEND_NEW_MESSAGE)
        .addStage()
        .action(Stage1Action1)
        .action(Stage1Action2)
        .action(Stage1Action3)
        // .onError(BottomEditTextCubit.setNewMessageError)
        .endStage()
        .addStage()
        .action(Stage2Action1)
        .action(Stage2Action2)
        .action(Stage2Action3)
        .endStage()
        .build()
        .listen((event) {}, onDone: () {
      print("zzzzz end flow");
    });
  }

  notify(BaseProcessorEvent event) {
    brokerSubscribers[event]?.forEach((processor) {
      processor.notify(event);
    });
  }

  emit(BaseProcessorEvent event) {
    notify(event);
  }

  Future Stage1Action1() async {
    print("zzzzz start: Stage1Action1");
    await Future.delayed(Duration(seconds: 1));
    print("zzzzz end: Stage1Action1");
  }

  Future Stage1Action2() async {
    print("zzzzz start: Stage1Action2");
    await Future.delayed(Duration(seconds: 2));
    print("zzzzz end: Stage1Action2");
  }

  Future Stage1Action3() async {
    print("zzzzz start: Stage1Action3");
    await Future.delayed(Duration(seconds: 3));
    print("zzzzz end: Stage1Action3");
  }

  Future Stage2Action1() async {
    print("zzzzz start: Stage2Action1");
    await Future.delayed(Duration(seconds: 1));
    print("zzzzz end: Stage2Action1");
  }

  Future Stage2Action2() async {
    print("zzzzz start: Stage2Action2");
    await Future.delayed(Duration(seconds: 2));
    print("zzzzz end: Stage2Action2");
  }

  Future Stage2Action3() async {
    print("zzzzz start: Stage2Action3");
    await Future.delayed(Duration(seconds: 3));
    print("zzzzz end: Stage2Action3");
  }
}

class FlowConfig {
  Stream? _flow;

  FlowEvent? _flowEvent;
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

  Stream build() {
    Stream stream = Stream.value(1);
    for (var stage in _stages) {
      stream = stream.asyncMap((event) => stage._buildStageFuture());
    }
    return stream;
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
    return await Stream.fromFutures(actions.map((e) async => await e()))
        .toList();
  }

}

// class IMStage {
//   apply(Stream flowStream) {
//     flowStream.zip(
//
//         ///)
//         }
// }

class IMFlow {}

enum FlowEvent { SEND_NEW_MESSAGE }

typedef ImAction = Future Function();
