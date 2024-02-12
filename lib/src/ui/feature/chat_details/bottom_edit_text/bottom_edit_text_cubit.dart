import 'package:im/src/ui/base/base_business_event.dart';
import 'package:im/src/ui/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../business/chat_history_business_broker.dart';
import 'bottom_edit_text_state.dart';

@injectable
class BottomEditTextCubit
    extends BaseCubit<ChatHistoryBusinessBroker, BottomEditTextState> {
  BottomEditTextCubit(businessBroker) : super(InitState(), businessBroker);

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() => [];

  @override
  notifyBusinessEvent(BaseBusinessEvent businessEvent, String message) {}

  void onEditTextChanged(String value) {
    final action = businessBroker.actions[NewMessageAction] as NewMessageAction;
    action.message = value;
  }
}
