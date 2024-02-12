import 'package:im/src/ui/base/base_processor_event.dart';

class ChatHistoryProcessorEvents implements BaseProcessorEvent {}

class SaveMessageToDataBase extends ChatHistoryProcessorEvents {}

class MessageSavedToDatabaseSuccess extends ChatHistoryProcessorEvents {}

class MessageSentToServerSuccess extends ChatHistoryProcessorEvents {}

class MessageUpdate extends ChatHistoryProcessorEvents {}
