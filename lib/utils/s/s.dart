import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class S {
  static final languageCode = Platform.localeName.split('_')[0];

  static final locale = Locale(languageCode);

  static const supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  static const localizationDelegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];
}

extension SExtension on BuildContext {
  AppLocalizations strings() => AppLocalizations.of(this);
}
