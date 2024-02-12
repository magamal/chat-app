import 'package:im/src/ui/base/base_processor_event.dart';

abstract class BaseProcessor {
  notify(BaseProcessorEvent event);
}
