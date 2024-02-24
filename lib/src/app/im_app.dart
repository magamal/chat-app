import 'package:flutter/material.dart';

import '../ui/feature/chat_details/chat_details_page.dart';


class RestartWidget extends StatefulWidget {
  final Widget child;

  const RestartWidget({Key? key, required this.child})
      :super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState? state =
    context.findAncestorStateOfType<_RestartWidgetState>();
    state?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}

class ImApp extends StatefulWidget {
  const ImApp({super.key});

  @override
  State<ImApp> createState() => _ImAppState();
}

class _ImAppState extends State<ImApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatDetailsPage(),
    );
  }
}
