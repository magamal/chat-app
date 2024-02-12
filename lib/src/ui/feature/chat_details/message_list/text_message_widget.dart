import 'package:flutter/material.dart';
import 'package:im/src/models/message.dart';

import '../../../styles/app_colors.dart';

class TextMessageWidget extends StatelessWidget {
  final Message message;

  const TextMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: SizedBox(
          child: Text(
            message.message,
            style: const TextStyle(color: AppColors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
