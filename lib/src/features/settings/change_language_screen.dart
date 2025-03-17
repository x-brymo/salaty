import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/localization/bloc/language_bloc.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('change_language')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context).add(ChangeLanguageEvent(Locale('en', 'US')));
              },
              child: Text(context.tr('english')),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context).add(ChangeLanguageEvent(Locale('ar', 'SA')));
              },
              child: Text(context.tr('arabic')),
            ),
          ],
        ),
      ),
    );
  }
}
