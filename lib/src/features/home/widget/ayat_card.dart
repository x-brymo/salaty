import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salaty/src/core/localization/app_localizations.dart';

import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/bloc/surah/surah_bloc.dart';
import '../../utils/sirat_card.dart';

class AyatCard extends StatelessWidget {
  const AyatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranBloc, QuranState>(
      builder: (context, state) {
        final quranList = state.qurans.getQuransByJuz(1);
         print("Current Quran Bloc State: ${state.qurans}"); // ✅ Debugging Log
        return SiratCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr("headTileQuran"),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              Divider(height: 32.h),

              // Check if data exists before accessing it
              if (quranList.isNotEmpty) ...[
                Text(
                  quranList.first.arabicText.toString(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontFamily: 'Uthman'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  quranList.first.urduTranslation.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
              ] else ...[
                Text(
                  "No Ayat available",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],

              // Surah Bloc
              BlocBuilder<SurahBloc, SurahState>(
                builder: (context, surahState) {
                  print("Current Surah Bloc State: ${surahState.surahs}");
                  if (surahState.surahs.surahs.isNotEmpty) {
                    final surah = surahState.surahs.surahs.first;
                    final verseCount = surah.place.isNotEmpty ? surah.place.length : 0;
                    return Text(
                      "${surah.nameAr}, ${surah.nameEn}, Verse 1-$verseCount",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  }
                  return Text(
                    "No Surah data available",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
