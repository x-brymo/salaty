part of 'quran_theme_bloc.dart';

abstract class QuranThemeEvent extends Equatable {
  const QuranThemeEvent();
}

class ShowTranslation extends QuranThemeEvent {
  final bool show;

  const ShowTranslation(this.show);

  @override
  List<Object> get props => [show];
}

class SwitchTranslationMode extends QuranThemeEvent {
  final String mode;

  const SwitchTranslationMode(this.mode);

  @override
  List<Object> get props => [mode];
}

class ShowWithArab extends QuranThemeEvent {
  final bool show;

  const ShowWithArab(this.show);

  @override
  List<Object> get props => [show];
}

class AddQuranFontSize extends QuranThemeEvent {
  const AddQuranFontSize();

  @override
  List<Object> get props => [];
}

class ReduceQuranFontSize extends QuranThemeEvent {
  const ReduceQuranFontSize();

  @override
  List<Object> get props => [];
}

class SetQuranFontFamily extends QuranThemeEvent {
  final String family;

  const SetQuranFontFamily(this.family);

  @override
  List<Object> get props => [family];
}

class AddTranslationFontSize extends QuranThemeEvent {
  const AddTranslationFontSize();

  @override
  List<Object> get props => [];
}

class ReduceTranslationFontSize extends QuranThemeEvent {
  const ReduceTranslationFontSize();

  @override
  List<Object> get props => [];
}

class SetTranslationFontFamily extends QuranThemeEvent {
  final String family;

  const SetTranslationFontFamily(this.family);

  @override
  List<Object> get props => [family];
}
