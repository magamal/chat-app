import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension LocalExtension on BuildContext {
  AppLocalizations get localZ => AppLocalizations.of(this)!;
}