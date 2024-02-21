import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:im/src/di/injector.dart';
import 'package:im/src/ui/feature/chat_details/chat_details_page.dart';
import 'package:im/src/ui/styles/app_theming.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
      environment: const String.fromEnvironment("app_env",
          defaultValue: Environment.prod));
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hybrid Theme'),
          ),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () => {
                  print('Set Light Theme'),
                  theme.setLightMode(),
                },
                child: Text('Set Light Theme'),
              ),
              ElevatedButton(
                onPressed: () => {
                  print('Set Dark theme'),
                  theme.setDarkMode(),
                },
                child: Text('Set Dark theme'),
              ),
              ElevatedButton(
                onPressed: () => {
                  print('Set orange theme'),
                  theme.setOrangeMode(),
                },
                child: Text('Set Orange theme'),
              ),
            ],
          ),
        ),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // TRY THIS: Try running your application with "flutter run". You'll see
    //     // the application has a blue toolbar. Then, without quitting the app,
    //     // try changing the seedColor in the colorScheme below to Colors.green
    //     // and then invoke "hot reload" (save your changes or press the "hot
    //     // reload" button in a Flutter-supported IDE, or press "r" if you used
    //     // the command line to start the app).
    //     //
    //     // Notice that the counter didn't reset back to zero; the application
    //     // state is not lost during the reload. To reset the state, use hot
    //     // restart instead.
    //     //
    //     // This works for code too, not just values: Most code changes can be
    //     // tested with just a hot reload.
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const ChatDetailsPage(),
    // );
  }
}
