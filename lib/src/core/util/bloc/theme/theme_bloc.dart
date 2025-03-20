import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(0)) {
    on<ThemeEvent>((event, emit) async {
      if (event is ToggleTheme) {
        emit(ThemeState(state.currentTheme == 0 ? 1 : 0));
      }
      
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(json['currentTheme']);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'currentTheme': state.currentTheme};
  }
}
