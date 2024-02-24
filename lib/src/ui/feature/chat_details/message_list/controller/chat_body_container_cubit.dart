import 'package:im/src/utils/logger/logger.dart';
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
    logDebug("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    logDebug("Finished: updateDataBase");
  }
}
