import 'dart:collection';

import 'package:im/src/database/base_processor.dart';
import 'package:im/src/ui/base/base_processor_event.dart';
import 'package:injectable/injectable.dart';

@singleton
class BusinessBrokerStream {
  final HashMap<BaseProcessorEvent, List<BaseProcessor>> brokerSubscribers =
      HashMap();

  subscripe(BaseProcessorEvent processorEvent, BaseProcessor processor) {
    if (brokerSubscribers.containsKey(processorEvent)) {
      brokerSubscribers[processorEvent]?.add(processor);
    } else {
      brokerSubscribers[processorEvent] = [processor];
    }
  }

  notify(BaseProcessorEvent event) {
    brokerSubscribers[event]?.forEach((processor) {
      processor.notify(event);
    });
  }

  emit(BaseProcessorEvent event) {
    notify(event);
  }
}
