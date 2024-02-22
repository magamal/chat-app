import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/src/business/base_mediator/base_mediator.dart';

import 'base_business_event.dart';

abstract class BaseCubit<BusinessMediator extends BaseMediator, State>
    extends Cubit<State> {
  final BusinessMediator mediator;

  BaseCubit(super.initialState, this.mediator) {
    _initBusinessBrokerEvents();
  }

  Future notifyBusinessEvent(BaseBusinessEvent businessEvent);

  List<BaseBusinessEvent> getEventsToSubscribeWithBusiness();

  void _initBusinessBrokerEvents() {
    getEventsToSubscribeWithBusiness().forEach((event) {
      mediator.subscribe(event, this);
    });
  }
}
