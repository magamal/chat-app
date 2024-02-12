import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_business_broker.dart';
import 'base_business_event.dart';

abstract class BaseCubit<
    BusinessBroker extends BaseBusinessBroker<BaseBusinessEvent>,
    State> extends Cubit<State> {
  final BusinessBroker businessBroker;

  BaseCubit(super.initialState, this.businessBroker) {
    _initBusinessBrokerEvents();
  }

  notifyBusinessEvent(BaseBusinessEvent businessEvent, String message);

  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness();

  void _initBusinessBrokerEvents() {
    getEventsToSubscribeWithBusiness().forEach((event) {
      businessBroker.subscribe(event, this);
    });
  }
}