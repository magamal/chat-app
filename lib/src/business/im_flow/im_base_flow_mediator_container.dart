import 'package:im/src/business/base_mediator/base_mediator.dart';
import 'package:im/src/ui/base/base_business_event.dart';

import 'im_base_flow.dart';

abstract class ImBaseFlowMediatorContainer {
  late IMFlow flow;
  late BaseMediator _mediator;


  FlowEvent getFlowEvent();

  IMFlow buildFlow(Map<String, dynamic> parameters);

  startFlow(Map<String, dynamic> parameters) {
    flow = buildFlow(parameters);
    flow.startFlow();
  }

  void attachToMediator(BaseMediator mediator) {
    _mediator = mediator;
  }

  notify(BaseBusinessEvent event) async{
    await _mediator.notify(event);
  }
}
