import 'package:im/src/ui/base/base_business_event.dart';
import 'package:im/src/ui/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../business/chat_mediator.dart';
import 'bottom_edit_text_state.dart';

@injectable
class BottomEditTextCubit
    extends BaseCubit<ChatMediator, BottomEditTextState> {


  BottomEditTextCubit(ChatMediator businessBroker)
      : super(InitState(), businessBroker);

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() => [];

  @override
  Future notifyBusinessEvent(BaseBusinessEvent businessEvent) async{}

  void onEditTextChanged(String value) {

  }

  String collectNewMessageData() {
    return "";
  }

  setNewMessageError() {

  }
}
