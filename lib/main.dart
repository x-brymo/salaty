import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'routes/routes.dart';
import 'src/core/localization/app_localizations.dart';
import 'src/core/localization/bloc/language_bloc.dart';
import 'src/core/notification/notification_service.dart';
import 'src/core/util/bloc/allah_names/allah_name_bloc.dart';
import 'src/core/util/bloc/database/database_bloc.dart';
import 'src/core/util/bloc/dua/dua_bloc.dart';
import 'src/core/util/bloc/juz/juz_bloc.dart';
import 'src/core/util/bloc/location/location_bloc.dart';
import 'src/core/util/bloc/notification/notification_bloc.dart';
import 'src/core/util/bloc/prayer_timing_bloc/timing_bloc.dart';
import 'src/core/util/bloc/quran/quran_bloc.dart';
import 'src/core/util/bloc/surah/surah_bloc.dart';
import 'src/core/util/bloc/tasbih/tasbih_bloc.dart';
import 'src/core/util/bloc/theme/theme_bloc.dart';
import 'src/core/util/bloc/time_format/time_format_bloc.dart';
import 'src/features/bottom_tab/bloc/tab/tab_bloc.dart';
import 'src/features/quran/bloc/quran_theme/quran_theme_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  // await init android_alarm_manager_plus
  await AndroidAlarmManager.initialize();
  Bloc.observer = TalkerBlocObserver(
    settings: TalkerBlocLoggerSettings(
      enabled: true,
      printEventFullData: false,
      printStateFullData: false,
      printChanges: true,
      printClosings: true,
      printCreations: true,
      printEvents: true,
      printTransitions: true,
      // If you want log only AuthBloc transitions
      transitionFilter: (bloc, transition) =>
          bloc.runtimeType.toString() == 'AuthBloc',
      // If you want log only AuthBloc events
      eventFilter: (bloc, event) => bloc.runtimeType.toString() == 'AuthBloc',
    ),
  );
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => TimeFormatBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => QuranThemeBloc(),
        ),
        BlocProvider(
          create: (context) => TimingBloc(),
        ),
        BlocProvider(
          create: (context) => AllahNameBloc(),
        ),
        BlocProvider(
          create: (context) => DuaBloc(),
        ),
        BlocProvider(
          create: (context) => QuranBloc(),
        ),
        BlocProvider(
          create: (context) => SurahBloc(),
        ),
        BlocProvider(
          create: (context) => TasbihBloc(),
        ),
        BlocProvider(
          create: (context) => JuzBloc(),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(),
        ),
        BlocProvider(
          create: (context) => TabBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return FutureBuilder<void>(
              future: SystemChrome.setPreferredOrientations(
                [
                  DeviceOrientation.portraitUp,
                ],
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ScreenUtilInit(
                    designSize: Size(414, 896),
                    builder: (context, child) {
                      return BlocBuilder<ThemeBloc, ThemeState>(
                        builder: (context, themeState) {
                          // Ensure state is not null
                          final theme = themeState.currentTheme ?? ThemeData.light();
                          return MaterialApp(
                            locale: state.locale,
                            supportedLocales: [
                              Locale('en', 'US'),
                              Locale('ar', 'SA'),
                            ],
                            localizationsDelegates: [
                              AppLocalizationsDelegate(),
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                            localeResolutionCallback: (locale, supportedLocales) {
                              for (var supportedLocale in supportedLocales) {
                                if (supportedLocale.languageCode == locale?.languageCode &&
                                    supportedLocale.countryCode == locale?.countryCode) {
                                  return supportedLocale;
                                }
                              }
                              return supportedLocales.first;
                            },
                            title: context.tr('title'),
                            debugShowCheckedModeBanner: false,
                            theme: ThemeData.dark(),
                            themeMode: ThemeMode.system,
                            darkTheme: ThemeData.dark(),
                            initialRoute: RouteGenerator.splash,
                            onGenerateRoute: RouteGenerator.generateRoute,
                            // routes: {
                            //   '/change_language': (context) => ChangeLanguageScreen(),
                            // },
                          );
                        },
                      );
                    },
                  );
                }
                return MaterialApp(
                  title: context.tr('title'),
                  debugShowCheckedModeBanner: false,
                  color: Colors.white,
                  home: Container(),
                );
              });
        },
      ),
    );
  }
}
