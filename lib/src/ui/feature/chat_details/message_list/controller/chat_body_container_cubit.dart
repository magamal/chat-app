import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../business/chat_history_business_events.dart';
import '../../../../../business/chat_mediator.dart';
import '../../../../../models/message.dart';
import '../../../../base/base_business_event.dart';
import '../../../../base/base_cubit.dart';

part 'chat_body_container_states.dart';

part 'chat_body_container_cubit.freezed.dart';

@injectable
class ChatBodyContainerCubit
    extends BaseCubit<ChatMediator, ChatBodyContainerStates> {
  ChatBodyContainerCubit(ChatMediator mediator)
      : super(const ChatBodyContainerStates.initial(), mediator) {}

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() =>
      [NewIncomingMessage(), MessageError()];

  @override
  Future notifyBusinessEvent(BaseBusinessEvent businessEvent) async {
    switch (businessEvent) {}
  }
}
