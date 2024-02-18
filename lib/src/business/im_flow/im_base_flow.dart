import 'dart:async';
import 'dart:collection';
import 'dart:core';

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
    List<ActionResult>? lastStageResult;
    for (var stage in _stages) {
      stream = stream.asyncMap((event) async {
        lastStageResult = await stage._buildStageFuture(lastStageResult);
        return lastStageResult;
      });
    }
    return IMFlow(stream, _flowEvent);
  }
}

class FlowStageBuilder {
  List<ImAction> actions = List.empty(growable: true);
  List<ImErrorActionType> errorActions = List.empty(growable: true);
  FlowConfig flowConfig;

  FlowStageBuilder(this.flowConfig);

  FlowStageBuilder action(String actionResultName, ImActionType action) {
    actions.add(ImAction(action, actionResultName));
    return this;
  }

  FlowStageBuilder onError(ImErrorActionType errorAction) {
    errorActions.add(errorAction);
    return this;
  }

  FlowConfig endStage() {
    return flowConfig;
  }

  Future<List<ActionResult>> _buildStageFuture(
      List<ActionResult>? lastStageResult) async {
    HashMap<String, ActionResult> result = HashMap();

    return await Stream.fromFutures(actions.map((action) async {
      final String actionName = action.actionName;

      try {
        final result = await action.action(lastStageResult);
        return ActionResult.success(actionName, result);
      } on Exception catch (exception, s) {
        await Stream.fromFutures(errorActions.map((errorAction) async =>
            await errorAction(actionName, exception))).toList();

        return ActionResult.error(actionName, exception);
      }
    })).toList();
  }
}

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

class ImAction {
  final ImActionType action;
  final String actionName;

  ImAction(this.action, this.actionName);
}

class ActionResult {
  final String actionName;
  final dynamic result;
  final Exception? exception;
  final bool isSuccess;

  ActionResult._(this.actionName, this.result, this.isSuccess, this.exception);

  factory ActionResult.success(actionName, result) =>
      ActionResult._(actionName, result, true, null);

  factory ActionResult.error(actionName, exception) =>
      ActionResult._(actionName, null, false, exception);
}

typedef ImActionType = Future Function(List<ActionResult>?);

typedef ImErrorActionType = Future Function(String, Exception?);
