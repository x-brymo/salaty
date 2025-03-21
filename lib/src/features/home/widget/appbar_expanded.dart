import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salaty/src/core/localization/app_localizations.dart';

import '../../../core/util/bloc/theme/theme_bloc.dart';
import 'kiblat_card.dart';

class AppBarExpanded extends StatefulWidget {
  const AppBarExpanded({super.key});

  @override
  State<AppBarExpanded> createState() => _AppBarExpandedState();
}

class _AppBarExpandedState extends State<AppBarExpanded> {
 
  final myAnimatedText = AnimatedTextController();
  @override
  Widget build(BuildContext context) {
    List<String> listText = [
      context.tr('welcome'),
      context.tr('welcome1'),
      context.tr('welcome2'),
      context.tr('welcome3'),
      context.tr('welcome4'),
  ];
    return SizedBox(
      width: 1.sw,
      height: 0.2.sh,
      child: Stack(
        children: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return SizedBox(
                width: 1.sw,
                height: 0.3.sh,
                child:
                    Theme.of(context).brightness == Brightness.dark
                        ? SvgPicture.asset(
                          'assets/images/home_icon/svg/night_mode.svg',
                          fit: BoxFit.cover,
                        )
                        : SvgPicture.asset(
                          'assets/images/home_icon/svg/day_mode.svg',
                          fit: BoxFit.cover,
                        ),
              );
            },
          ),
          Container(
            width: 1.sw,
            height: 0.3.sh,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: [0.2, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedTextKit(
                  animatedTexts: listText
                      .map(
                        (text) => TypewriterAnimatedText(
                          text,
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          speed: const Duration(milliseconds: 100),
                        ),
                      )
                      .toList(),

                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  controller: myAnimatedText,
                ),
                // Text(
                //   'Assalamu alaikum',
                //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
                //         fontWeight: FontWeight.bold,
                //       ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: KiblatCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
