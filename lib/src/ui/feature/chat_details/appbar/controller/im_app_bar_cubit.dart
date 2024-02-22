import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im/src/business/chat_mediator.dart';
import 'package:im/src/business/im_flow/send_message_flow.dart';

import 'package:injectable/injectable.dart';

import '../../../../base/base_business_event.dart';
import '../../../../base/base_cubit.dart';

part 'im_app_bar_cubit.freezed.dart';

part 'im_app_bar_state.dart';

@injectable
class ImAppBarCubit extends BaseCubit<ChatMediator, ImAppBarState> {
  ImAppBarCubit(ChatMediator mediator)
      : super(const ImAppBarState.initial(), mediator);

  void addMessage() {
    mediator.addMessage();
  }

  void onNewIncomingMessage() {}

  @override
  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness() => [];

  @override
  Future notifyBusinessEvent(BaseBusinessEvent businessEvent) async {}
}
