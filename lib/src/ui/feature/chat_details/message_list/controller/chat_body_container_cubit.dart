import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../business/chat_history_business_broker.dart';
import '../../../../../business/chat_history_business_events.dart';
import '../../../../../models/message.dart';
import '../../../../base/base_business_event.dart';
import '../../../../base/base_cubit.dart';

part 'chat_body_container_states.dart';

part 'chat_body_container_cubit.freezed.dart';

@injectable
class ChatBodyContainerCubit
    extends BaseCubit<ChatHistoryBusinessBroker, ChatBodyContainerStates> {
  ChatBodyContainerCubit(businessBroker)
      : super(const ChatBodyContainerStates.initial(), businessBroker) {}

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() =>
      [NewIncomingMessage(), MessageError()];

  @override
  notifyBusinessEvent(BaseBusinessEvent businessEvent, String message) {
    switch (businessEvent) {}
  }
}
