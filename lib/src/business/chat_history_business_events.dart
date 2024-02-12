
import '../ui/base/base_business_event.dart';

sealed class ChatHistoryBusinessEvents implements BaseBusinessEvent {}

class NewIncomingMessage extends ChatHistoryBusinessEvents {}

class MessageError extends ChatHistoryBusinessEvents {}