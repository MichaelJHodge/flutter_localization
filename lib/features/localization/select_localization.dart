import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../util/localization.dart';

class SelectLocalizationScreen extends StatefulWidget {
  const SelectLocalizationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocalizationScreen> createState() =>
      _SelectLocalizationScreenState();
}

class _SelectLocalizationScreenState extends State<SelectLocalizationScreen> {
  void localeHandler(BuildContext context, String value) {
    var locale = Provider.of<AppLocalization>(context, listen: false);

    locale.updateLocale(Locale(value.toString(), ""));
  }

  Widget localeSelector(AppLocalization locale) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text("Change Locale"),
              isDense: true,
              borderRadius: BorderRadius.circular(8),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              onChanged: (value) => localeHandler(context, value!),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 26,
                color: Colors.grey,
              ),
              value: AppLocalizations.of(context)!.localeName,
              dropdownColor: Colors.white,
              padding: const EdgeInsets.all(8),
              items: [
                DropdownMenuItem<String>(
                  value: "en",
                  onTap: () => localeHandler(context, "en"),
                  child: const Text(
                    "English",
                    style: TextStyle(),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "es",
                  onTap: () => localeHandler(context, "es"),
                  child: const Text(
                    "Spanish",
                    style: TextStyle(),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget localeText(AppLocalization locale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            AppLocalizations.of(context)!.helloUser,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<AppLocalization>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff84404),
        title: Text(
          AppLocalizations.of(context)!.localizationDemo,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          localeSelector(locale),
          localeText(locale),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
