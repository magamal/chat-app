import 'package:flutter/material.dart';
import 'package:im/src/di/injector.dart';

import 'bottom_edit_text_cubit.dart';

class MessageBoxEditTextWidget extends StatefulWidget {
  const MessageBoxEditTextWidget({super.key});

  @override
  State<MessageBoxEditTextWidget> createState() =>
      _MessageBoxEditTextWidgetState();
}

class _MessageBoxEditTextWidgetState extends State<MessageBoxEditTextWidget> {
  late BottomEditTextCubit _cubit;

  @override
  void initState() {
    _cubit = inject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        _cubit.onEditTextChanged(value);
      },
    );
  }
}
