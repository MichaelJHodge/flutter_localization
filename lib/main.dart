import 'package:flutter/material.dart';
import 'package:michael_hodge_localization/features/localization/select_localization.dart';
import 'package:michael_hodge_localization/util/localization.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLocalization locale = AppLocalization();
  await locale.getLocale();
  runApp(
    MyApp(
      appLanguage: locale,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppLocalization appLanguage;

  const MyApp({super.key, required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLocalization>(
      create: (_) => appLanguage,
      child: Consumer<AppLocalization>(builder: (context, model, child) {
        return MaterialApp(
          locale: appLanguage.appLocal,
          title: 'Localization Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xfff84404)),
            useMaterial3: true,
          ),
          home: const SelectLocalizationScreen(),
        );
      }),
    );
  }
}
