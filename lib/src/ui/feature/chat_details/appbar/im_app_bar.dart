import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/src/di/injector.dart';
import 'package:im/src/resources/localz.dart';

import '../../../styles/app_colors.dart';
import 'controller/im_app_bar_cubit.dart';
import 'im_title_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ImAppBar extends AppBar {
  ImAppBar({super.key});

  @override
  State<ImAppBar> createState() => _ImAppBarState();
}

class _ImAppBarState extends State<ImAppBar> {
  late ImAppBarCubit cubit;

  @override
  void initState() {
    cubit = inject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      toolbarHeight: 80,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: BlocConsumer(
        bloc: cubit,
        builder: (BuildContext context, ImAppBarState state) {
          final numberOfMessages = state.map(
              initial: (state) => "",
              numberOfMessagesChanged: (state) => state.numberOfMessages);

          return ImTitleText(text: "${context.localZ.messages} $numberOfMessages");
        },
        listener: (BuildContext context, ImAppBarState state) {},
      ),
      actions: [
        IconButton(
            onPressed: () {
              cubit.addMessage();
            },
            icon: const Icon(Icons.add))
      ],
    );
  }
}

abstract class AppBarCallback {
  void onAddMessageClicked();
}
