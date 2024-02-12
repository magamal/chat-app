import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/src/di/injector.dart';
import 'package:im/src/ui/feature/chat_details/message_list/text_message_widget.dart';

import '../../../shared_ui_widgets/im_loading_widget.dart';
import 'controller/chat_body_container_cubit.dart';

class ChatBodyContainer extends StatefulWidget {
  const ChatBodyContainer({super.key});

  @override
  State<ChatBodyContainer> createState() => _ChatBodyContainerState();
}

class _ChatBodyContainerState extends State<ChatBodyContainer> {
  late ChatBodyContainerCubit _cubit;

  @override
  void initState() {
    _cubit = inject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBodyContainerCubit, ChatBodyContainerStates>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (BuildContext context, ChatBodyContainerStates state) {
        return state.when(
            initial: () => Container(),
            loading: () => const ImLoadingWidget(),
            success: (messages) => ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    TextMessageWidget(message: messages[index])));
      },
    );
  }
}
