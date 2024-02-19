import 'package:flutter/material.dart';
import 'package:im/src/di/injector.dart';
import 'package:im/src/resources/theme_data.dart';
import 'package:im/src/ui/feature/chat_details/chat_details_page.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
      environment: const String.fromEnvironment("app_env",
          defaultValue: Environment.prod));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // supportedLocales: const [
      //   Locale('en'), // English
      //   Locale('ar'), // Arabic
      // ],
      theme: AppTheme.LIGHT_THEME,
      home: const ChatDetailsPage(),
    );
  }
}
