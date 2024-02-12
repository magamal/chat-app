import 'dart:collection';

import 'base_business_event.dart';
import 'base_cubit.dart';

abstract class BaseBusinessBroker<BusinessEvents extends BaseBusinessEvent> {
  final HashMap<BusinessEvents, List<BaseCubit>> subscribers = HashMap();

  subscribe(BusinessEvents event, BaseCubit cubit) {
    if (subscribers.containsKey(event)) {
      subscribers[event]?.add(cubit);
    } else {
      subscribers[event] = [cubit];
    }
  }
}
