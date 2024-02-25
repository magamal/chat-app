import 'dart:collection';

import 'package:im/src/di/injector.dart';
import 'package:injectable/injectable.dart';

import '../../ui/base/base_cubit.dart';
import '../../ui/base/base_business_event.dart';
import '../im_flow/im_base_flow.dart';
import '../im_flow/im_base_flow_mediator_container.dart';

abstract class BaseMediator {
  final HashMap<FlowEvent, ImBaseFlowMediatorContainer> imFlows = HashMap();

  final HashMap<BaseBusinessEvent, List<BaseCubit>> subscribers = HashMap();

  BaseMediator() {
    initFlows();
  }

  void initFlows();

  attachFlow(Type type) {
    final flow = getIt(type: type) as ImBaseFlowMediatorContainer;
    flow.attachToMediator(this);
    imFlows[flow.getFlowEvent()] = flow;
  }

  subscribe(BaseBusinessEvent event, BaseCubit cubit) {
    if (subscribers.containsKey(event)) {
      subscribers[event]?.add(cubit);
    } else {
      subscribers[event] = [cubit];
    }
  }

  notify(BaseBusinessEvent event) async {
    final cubits = subscribers[event];
    if (cubits != null) {
      await Future.forEach(
          cubits, (cubit) => cubit.notifyBusinessEvent(event));
    }
  }
}
