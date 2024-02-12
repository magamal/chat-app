import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

import '../../../../../business/chat_history_business_broker.dart';
import '../../../../../business/chat_history_business_events.dart';
import '../../../../base/base_business_event.dart';
import '../../../../base/base_cubit.dart';

part 'im_app_bar_cubit.freezed.dart';

part 'im_app_bar_state.dart';

@injectable
class ImAppBarCubit
    extends BaseCubit<ChatHistoryBusinessBroker, ImAppBarState> {
  ImAppBarCubit(businessBroker)
      : super(const ImAppBarState.initial(), businessBroker);

  void addMessage() {
    businessBroker.actions[NewMessageAction]?.apply();
  }

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() =>
      [NewIncomingMessage()];

  @override
  notifyBusinessEvent(BaseBusinessEvent businessEvent, String message) {
    switch (businessEvent) {
      case NewIncomingMessage():
        onNewIncomingMessage();
    }
  }

  void onNewIncomingMessage() {}
}
