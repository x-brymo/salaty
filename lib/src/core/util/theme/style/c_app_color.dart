import 'package:flutter/material.dart';


class AppColor {
  final ColorScheme colorScheme;

  AppColor({
    required this.colorScheme,
  });

  static ColorScheme choseColor(context) {
    return Theme.of(context).colorScheme;
  }

  // Light Theme
  factory AppColor.lightTheme() {
    return AppColor(
        colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xfb3b82f680),
      onPrimary: Colors.white,
      //primaryContainer: Colors.blue[100],
      onPrimaryContainer: Colors.black,
      secondary: Colors.green,
      onSecondary: Colors.black,
      secondaryContainer: Colors.green[100],
      onSecondaryContainer: Colors.white,
      tertiary: Colors.yellow,
      onTertiary: Colors.black,
      tertiaryContainer: Colors.yellow[100],
      onTertiaryContainer: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      errorContainer: Colors.red[100],
      onErrorContainer: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      surfaceContainerHighest: Colors.grey[200],
      onSurfaceVariant: Colors.black,
      outline: Colors.grey,
      outlineVariant: Colors.black,
      shadow: Colors.grey[700],
      scrim: Colors.black.withOpacity(0.5),
      inverseSurface: Colors.black,
      onInverseSurface: Colors.white,
      inversePrimary: Colors.blue,
      surfaceTint: Colors.blue[100],
    ));
  }

  // Dark Theme
  factory AppColor.darkTheme() {
    return AppColor(
        colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfb3b82f680),
      onPrimary: Colors.white,
      primaryContainer: Colors.blue[100],
      onPrimaryContainer: Colors.black,
      secondary: Colors.teal,
      onSecondary: Colors.white,
      secondaryContainer: Colors.teal[700],
      onSecondaryContainer: Colors.white,
      tertiary: Colors.amber,
      onTertiary: Colors.black,
      tertiaryContainer: Colors.amber[700],
      onTertiaryContainer: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      errorContainer: Colors.red[700],
      onErrorContainer: Colors.white,
      surface: Color(0xFF171717),
      onSurface: Colors.white,
      surfaceContainerHighest: Colors.grey[800],
      onSurfaceVariant: Colors.white,
      outline: Colors.grey,
      outlineVariant: Colors.white,
      shadow: Colors.black,
      scrim: Colors.black.withOpacity(0.5),
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
      inversePrimary: Colors.blue,
      surfaceTint: Colors.deepOrange[700],
    ));
  }

//   // Theme 3: Light Orange
//   factory AppColor.lightTheme3() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.orange,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.orange[100],
//           onPrimaryContainer: Colors.black,
//       secondary: Colors.blue,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.blue[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.blue,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.blue[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.amber[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.orange,
//       surfaceTint: Colors.orange[100],
//     ));
//   }

//   // Theme 4: Dark Green
//   factory AppColor.darkTheme4() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.green[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.green[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.pink,
//       onSecondary: Colors.white,
//       secondaryContainer: Colors.pink[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.pink,
//       onTertiary: Colors.white,
//       tertiaryContainer: Colors.pink[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff3e3939),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.green,
//       surfaceTint: Colors.green[700],
//     ));
//   }

//   // Theme 5: Light Pink
//   factory AppColor.lightTheme5() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.pink,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.pink[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.yellow,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.yellow[100],
//       onSecondaryContainer: Colors.black,
//       tertiary: Colors.yellow,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.yellow[100],
//       onTertiaryContainer: Colors.black,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.pink[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.pink,
//       surfaceTint: Colors.pink[100],
//     ));
//   }

//   // Theme 6: Dark Red
//   factory AppColor.darkTheme6() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.red,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.red[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.orange,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.orange[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.orange,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.orange[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.red,
//       surfaceTint: Colors.red[700],
//     ));
//   }

//   // Theme 7: Light Green
//   factory AppColor.lightTheme7() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.green,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.green[100],
//           onPrimaryContainer: Colors.black,
//       secondary: Colors.teal,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.teal[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.teal,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.teal[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.lightGreen[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.green,
//       surfaceTint: Colors.green[100],
//     ));
//   }

//   // Theme 8: Dark Blue
//   factory AppColor.darkTheme8() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.blue,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.blue[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.amber,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.amber[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.amber,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.amber[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.blue,
//       surfaceTint: Colors.blue[700],
//     ));
//   }

//   // Theme 9: Light Purple
//   factory AppColor.lightTheme9() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.purple,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.purple[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.cyan,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.cyan[100],
//       onSecondaryContainer: Colors.black,
//       tertiary: Colors.cyan,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.cyan[100],
//       onTertiaryContainer: Colors.black,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.purple[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.purple,
//       surfaceTint: Colors.purple[100],
//     ));
//   }

//   // Theme 10: Dark Orange
//   factory AppColor.darkTheme10() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.orange[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.orange[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.yellow,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.yellow[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.yellow,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.yellow[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.orange,
//       surfaceTint: Colors.orange[700],
//     ));
//   }

//   // Theme 11: Light Teal
//   factory AppColor.lightTheme11() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.teal,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.teal[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.purple,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.purple[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.purple,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.purple[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.teal[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.teal,
//       surfaceTint: Colors.teal[100],
//     ));
//   }

// // Theme 12: Dark Pink
//   factory AppColor.darkTheme12() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.pink[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.pink[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.deepPurple,
//       onSecondary: Colors.white,
//       secondaryContainer: Colors.deepPurple[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.deepPurple,
//       onTertiary: Colors.white,
//       tertiaryContainer: Colors.deepPurple[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.pink,
//       surfaceTint: Colors.pink[700],
//     ));
//   }

// // Theme 13: Light Cyan
//   factory AppColor.lightTheme13() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.cyan,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.cyan[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.orange,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.orange[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.orange,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.orange[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.cyan[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.cyan,
//       surfaceTint: Colors.cyan[100],
//     ));
//   }

// // Theme 14: Dark Brown
//   factory AppColor.darkTheme14() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.brown[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.brown[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.blueGrey,
//       onSecondary: Colors.white,
//       secondaryContainer: Colors.blueGrey[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.blueGrey,
//       onTertiary: Colors.white,
//       tertiaryContainer: Colors.blueGrey[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.brown,
//       surfaceTint: Colors.brown[700],
//     ));
//   }

// // Theme 15: Light Indigo
//   factory AppColor.lightTheme15() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.indigo,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.indigo[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.amber,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.amber[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.amber,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.amber[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.indigo[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.indigo,
//       surfaceTint: Colors.indigo[100],
//     ));
//   }

// // Theme 16: Dark Yellow
//   factory AppColor.darkTheme16() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.yellow[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.yellow[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.lightBlue,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.lightBlue[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.lightBlue,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.lightBlue[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.yellow,
//       surfaceTint: Colors.yellow[700],
//     ));
//   }

// // Theme 17: Light Amber
//   factory AppColor.lightTheme17() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.amber,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.amber[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.pink,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.pink[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.pink,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.pink[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.amber[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.amber,
//       surfaceTint: Colors.amber[100],
//     ));
//   }

// // Theme 18: Dark Grey
//   factory AppColor.darkTheme18() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.grey[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.grey[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.redAccent,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.redAccent[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.redAccent,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.redAccent[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.grey,
//       surfaceTint: Colors.grey[700],
//     ));
//   }

// // Theme 19: Light Lime
//   factory AppColor.lightTheme19() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.lime,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.lime[100],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.red,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.red[100],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.red,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.red[100],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[100],
//       onErrorContainer: Colors.white,
//       background: Colors.lime[100]!,
//       onBackground: Colors.black,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceVariant: Colors.grey[200],
//       onSurfaceVariant: Colors.black,
//       outline: Colors.grey,
//       outlineVariant: Colors.black,
//       shadow: Colors.grey[700],
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.black,
//       onInverseSurface: Colors.white,
//       inversePrimary: Colors.lime,
//       surfaceTint: Colors.lime[100],
//     ));
//   }

// // Theme 20: Dark Purple
//   factory AppColor.darkTheme20() {
//     return AppColor(
//         colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: Colors.purple[900]!,
//       onPrimary: Colors.white,
//       primaryContainer: Colors.purple[700],
//       onPrimaryContainer: Colors.white,
//       secondary: Colors.blue,
//       onSecondary: Colors.black,
//       secondaryContainer: Colors.blue[700],
//       onSecondaryContainer: Colors.white,
//       tertiary: Colors.blue,
//       onTertiary: Colors.black,
//       tertiaryContainer: Colors.blue[700],
//       onTertiaryContainer: Colors.white,
//       error: Colors.red,
//       onError: Colors.white,
//       errorContainer: Colors.red[700],
//       onErrorContainer: Colors.white,
//       background: const Color(0xff404040),
//       onBackground: Colors.white,
//       surface: Colors.black,
//       onSurface: Colors.white,
//       surfaceVariant: Colors.grey[800],
//       onSurfaceVariant: Colors.white,
//       outline: Colors.grey,
//       outlineVariant: Colors.white,
//       shadow: Colors.black,
//       scrim: Colors.black.withOpacity(0.5),
//       inverseSurface: Colors.white,
//       onInverseSurface: Colors.black,
//       inversePrimary: Colors.purple,
//       surfaceTint: Colors.purple[100],
//     ));
//   }

// // Theme 21: Light Teal
//   factory AppColor.lightTheme21() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.light,
//         primary: Colors.teal,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.teal[100],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.blue,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.blue[100],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.blue,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.blue[100],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[100],
//         onErrorContainer: Colors.white,
//         background: Colors.teal[100]!,
//         onBackground: Colors.black,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         surfaceVariant: Colors.grey[200],
//         onSurfaceVariant: Colors.black,
//         outline: Colors.grey,
//         outlineVariant: Colors.black,
//         shadow: Colors.grey[700],
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.black,
//         onInverseSurface: Colors.white,
//         inversePrimary: Colors.teal,
//         surfaceTint: Colors.teal[100],
//       ),
//     );
//   }

// // Theme 22: Dark Brown
//   factory AppColor.darkTheme22() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: Colors.brown[900]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.brown[700],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.teal,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.teal[700],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.teal,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.teal[700],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[700],
//         onErrorContainer: Colors.white,
//         background: const Color(0xff404040),
//         onBackground: Colors.white,
//         surface: Colors.black,
//         onSurface: Colors.white,
//         surfaceVariant: Colors.grey[800],
//         onSurfaceVariant: Colors.white,
//         outline: Colors.grey,
//         outlineVariant: Colors.white,
//         shadow: Colors.black,
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.white,
//         onInverseSurface: Colors.black,
//         inversePrimary: Colors.brown,
//         surfaceTint: Colors.brown[700],
//       ),
//     );
//   }

// // Theme 23: Light Lime Green
//   factory AppColor.lightTheme23() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.light,
//         primary: Colors.lime[300]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.lime[100],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.green,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.green[100],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.green,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.green[100],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[100],
//         onErrorContainer: Colors.white,
//         background: Colors.lime[100]!,
//         onBackground: Colors.black,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         surfaceVariant: Colors.grey[200],
//         onSurfaceVariant: Colors.black,
//         outline: Colors.grey,
//         outlineVariant: Colors.black,
//         shadow: Colors.grey[700],
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.black,
//         onInverseSurface: Colors.white,
//         inversePrimary: Colors.lime[300]!,
//         surfaceTint: Colors.lime[100],
//       ),
//     );
//   }

// // Theme 24: Dark Cyan
//   factory AppColor.darkTheme24() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: Colors.cyan[900]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.cyan[700],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.orange,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.orange[700],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.orange,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.orange[700],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[700],
//         onErrorContainer: Colors.white,
//         background: const Color(0xff404040),
//         onBackground: Colors.white,
//         surface: Colors.black,
//         onSurface: Colors.white,
//         surfaceVariant: Colors.grey[800],
//         onSurfaceVariant: Colors.white,
//         outline: Colors.grey,
//         outlineVariant: Colors.white,
//         shadow: Colors.black,
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.white,
//         onInverseSurface: Colors.black,
//         inversePrimary: Colors.cyan,
//         surfaceTint: Colors.cyan[700],
//       ),
//     );
//   }

// // Theme 25: Light Indigo
//   factory AppColor.lightTheme25() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.light,
//         primary: Colors.indigo,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.indigo[100],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.deepOrange,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.deepOrange[100],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.deepOrange,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.deepOrange[100],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[100],
//         onErrorContainer: Colors.white,
//         background: Colors.indigo[100]!,
//         onBackground: Colors.black,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         surfaceVariant: Colors.grey[200],
//         onSurfaceVariant: Colors.black,
//         outline: Colors.grey,
//         outlineVariant: Colors.black,
//         shadow: Colors.grey[700],
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.black,
//         onInverseSurface: Colors.white,
//         inversePrimary: Colors.indigo,
//         surfaceTint: Colors.indigo[100],
//       ),
//     );
//   }

// // Theme 26: Dark Lime Green
//   factory AppColor.darkTheme26() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: Colors.green[900]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.green[700],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.blueGrey,
//         onSecondary: Colors.white,
//         secondaryContainer: Colors.blueGrey[700],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.blueGrey,
//         onTertiary: Colors.white,
//         tertiaryContainer: Colors.blueGrey[700],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[700],
//         onErrorContainer: Colors.white,
//         background: const Color(0xff404040),
//         onBackground: Colors.white,
//         surface: Colors.black,
//         onSurface: Colors.white,
//         surfaceVariant: Colors.grey[800],
//         onSurfaceVariant: Colors.white,
//         outline: Colors.grey,
//         outlineVariant: Colors.white,
//         shadow: Colors.black,
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.white,
//         onInverseSurface: Colors.black,
//         inversePrimary: Colors.green,
//         surfaceTint: Colors.green[700],
//       ),
//     );
//   }

// // Theme 27: Light Amber
//   factory AppColor.lightTheme27() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.light,
//         primary: Colors.amber,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.amber[100],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.red,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.red[100],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.red,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.red[100],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[100],
//         onErrorContainer: Colors.white,
//         background: Colors.amber[100]!,
//         onBackground: Colors.black,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         surfaceVariant: Colors.grey[200],
//         onSurfaceVariant: Colors.black,
//         outline: Colors.grey,
//         outlineVariant: Colors.black,
//         shadow: Colors.grey[700],
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.black,
//         onInverseSurface: Colors.white,
//         inversePrimary: Colors.amber,
//         surfaceTint: Colors.amber[100],
//       ),
//     );
//   }

// // Theme 28: Dark Pink
//   factory AppColor.darkTheme28() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: Colors.pink[900]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.pink[700],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.purple,
//         onSecondary: Colors.white,
//         secondaryContainer: Colors.purple[700],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.purple,
//         onTertiary: Colors.white,
//         tertiaryContainer: Colors.purple[700],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[700],
//         onErrorContainer: Colors.white,
//         background: const Color(0xff404040),
//         onBackground: Colors.white,
//         surface: Colors.black,
//         onSurface: Colors.white,
//         surfaceVariant: Colors.grey[800],
//         onSurfaceVariant: Colors.white,
//         outline: Colors.grey,
//         outlineVariant: Colors.white,
//         shadow: Colors.black,
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.white,
//         onInverseSurface: Colors.black,
//         inversePrimary: Colors.pink,
//         surfaceTint: Colors.pink[700],
//       ),
//     );
//   }

// // Theme 29: Light Deep Orange
//   factory AppColor.lightTheme29() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.light,
//         primary: Colors.deepOrange,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.deepOrange[100],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.blueGrey,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.blueGrey[100],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.blueGrey,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.blueGrey[100],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[100],
//         onErrorContainer: Colors.white,
//         background: Colors.deepOrange[100]!,
//         onBackground: Colors.black,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         surfaceVariant: Colors.grey[200],
//         onSurfaceVariant: Colors.black,
//         outline: Colors.grey,
//         outlineVariant: Colors.black,
//         shadow: Colors.grey[700],
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.black,
//         onInverseSurface: Colors.white,
//         inversePrimary: Colors.deepOrange,
//         surfaceTint: Colors.deepOrange[100],
//       ),
//     );
//   }

// // Theme 30: Dark Lime
//   factory AppColor.darkTheme30() {
//     return AppColor(
//       colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: Colors.lime[900]!,
//         onPrimary: Colors.white,
//         primaryContainer: Colors.lime[700],
//         onPrimaryContainer: Colors.white,
//         secondary: Colors.lightBlue,
//         onSecondary: Colors.black,
//         secondaryContainer: Colors.lightBlue[700],
//         onSecondaryContainer: Colors.white,
//         tertiary: Colors.lightBlue,
//         onTertiary: Colors.black,
//         tertiaryContainer: Colors.lightBlue[700],
//         onTertiaryContainer: Colors.white,
//         error: Colors.red,
//         onError: Colors.white,
//         errorContainer: Colors.red[700],
//         onErrorContainer: Colors.white,
//         background: const Color(0xff404040),
//         onBackground: Colors.white,
//         surface: Colors.black,
//         onSurface: Colors.white,
//         surfaceVariant: Colors.grey[800],
//         onSurfaceVariant: Colors.white,
//         outline: Colors.grey,
//         outlineVariant: Colors.white,
//         shadow: Colors.black,
//         scrim: Colors.black.withOpacity(0.5),
//         inverseSurface: Colors.white,
//         onInverseSurface: Colors.black,
//         inversePrimary: Colors.lime,
//         surfaceTint: Colors.lime[700],
//       ),
//     );
//   }

// Add the new themes to the availableColorSchemes list
  static List<ColorScheme> availableColorSchemes = [
    AppColor.lightTheme().colorScheme,
    AppColor.darkTheme().colorScheme,
    // AppColor.lightTheme3().colorScheme,
    // AppColor.darkTheme4().colorScheme,
    // AppColor.lightTheme5().colorScheme,
    // AppColor.darkTheme6().colorScheme,
    // AppColor.lightTheme7().colorScheme,
    // AppColor.darkTheme8().colorScheme,
    // AppColor.lightTheme9().colorScheme,
    // AppColor.darkTheme10().colorScheme,
    // AppColor.lightTheme11().colorScheme,
    // AppColor.darkTheme12().colorScheme,
    // AppColor.lightTheme13().colorScheme,
    // AppColor.darkTheme14().colorScheme,
    // AppColor.lightTheme15().colorScheme,
    // AppColor.darkTheme16().colorScheme,
    // AppColor.lightTheme17().colorScheme,
    // AppColor.darkTheme18().colorScheme,
    // AppColor.lightTheme19().colorScheme,
    // AppColor.darkTheme20().colorScheme,
    // AppColor.lightTheme21().colorScheme,
    // AppColor.darkTheme22().colorScheme,
    // AppColor.lightTheme23().colorScheme,
    // AppColor.darkTheme24().colorScheme,
    // AppColor.lightTheme25().colorScheme,
    // AppColor.darkTheme26().colorScheme,
    // AppColor.lightTheme27().colorScheme,
    // AppColor.darkTheme28().colorScheme,
    // AppColor.lightTheme29().colorScheme,
    // AppColor.darkTheme30().colorScheme,
  ];

  static List<String> themeNames = [
    'Light Theme',
    'Dark Theme',
    // 'Light Orange',
    // 'Dark Green',
    // 'Light Pink',
    // 'Dark Red',
    // 'Light Green',
    // 'Dark Blue',
    // 'Light Purple',
    // 'Dark Orange',
    // 'Light Theme 11', // New theme name
    // 'Dark Theme 12', // New theme name
    // 'Light Theme 13', // New theme name
    // 'Dark Theme 14', // New theme name
    // 'Light Theme 15', // New theme name
    // 'Dark Theme 16', // New theme name
    // 'Light Theme 17', // New theme name
    // 'Dark Theme 18', // New theme name
    // 'Light Theme 19', // New theme name
    // 'Dark Theme 20', // New theme name
    // 'Light Theme 21', // New theme name
    // 'Dark Theme 22', // New theme name
    // 'Light Theme 23', // New theme name
    // 'Dark Theme 24', // New theme name
    // 'Light Theme 25', // New theme name
    // 'Dark Theme 26', // New theme name
    // 'Light Theme 27', // New theme name
    // 'Dark Theme 28', // New theme name
    // 'Light Theme 29', // New theme name
    // 'Dark Theme 30', // New theme name
  ];

  static String getThemeName(int index) {
    switch (index) {
      case 0:
        return 'Light Theme';
      case 1:
        return 'Dark Theme';
      // case 2:
      //   return 'Light Orange Theme';
      // case 3:
      //   return 'Dark Green Theme';
      // case 4:
      //   return 'Light Pink Theme';
      // case 5:
      //   return 'Dark Red Theme';
      // case 6:
      //   return 'Light Green Theme';
      // case 7:
      //   return 'Dark Blue Theme';
      // case 8:
      //   return 'Light Purple Theme';
      // case 9:
      //   return 'Dark Orange Theme';
      // case 10:
      //   return 'Light Theme 11';
      // case 11:
      //   return 'Dark Theme 12';
      // case 12:
      //   return 'Light Theme 13';
      // case 13:
      //   return 'Dark Theme 14';
      // case 14:
      //   return 'Light Theme 15';
      // case 15:
      //   return 'Dark Theme 16';
      // case 16:
      //   return 'Light Theme 17';
      // case 17:
      //   return 'Dark Theme 18';
      // case 18:
      //   return 'Light Theme 19';
      // case 19:
      //   return 'Dark Theme 20';
      // case 20:
      //   return 'Light Theme 21';
      // case 21:
      //   return 'Dark Theme 22';
      // case 22:
      //   return 'Light Theme 23';
      // case 23:
      //   return 'Dark Theme 24';
      // case 24:
      //   return 'Light Theme 25';
      // case 25:
      //   return 'Dark Theme 26';
      // case 26:
      //   return 'Light Theme 27';
      // case 27:
      //   return 'Dark Theme 28';
      // case 28:
      //   return 'Light Theme 29';
      // case 29:
      //   return 'Dark Theme 30';
      default:
        return 'Unknown Theme';
    }
  }
}

/*
brightness: تحدد السطوع العام لنظام الألوان، إما Brightness.light للسطوع الفاتح أو Brightness.dark للسطوع الداكن.

primary: اللون الأساسي المستخدم لعناصر واجهة المستخدم البارزة مثل الأزرار والعناصر المحددة.

onPrimary: اللون المستخدم للنص والرموز فوق اللون الأساسي.

primaryContainer: لون اختياري يمكن استخدامه كلون خلفية للعناصر التي تستخدم اللون الأساسي.

onPrimaryContainer: لون اختياري يستخدم كلون للنص والرموز فوق primaryContainer.

secondary: اللون الثانوي المستخدم لعناصر واجهة المستخدم مثل المفاتيح والمؤشرات.

onSecondary: اللون المستخدم للنص والرموز فوق اللون الثانوي.

secondaryContainer: لون اختياري يمكن استخدامه كلون خلفية للعناصر التي تستخدم اللون الثانوي.

onSecondaryContainer: لون اختياري يستخدم كلون للنص والرموز فوق secondaryContainer.

tertiary: لون إضافي يستخدم في تصميم واجهة المستخدم.

onTertiary: اللون المستخدم للنص والرموز فوق اللون الثالثي.

tertiaryContainer: لون اختياري يمكن استخدامه كلون خلفية للعناصر التي تستخدم اللون الثالثي.

onTertiaryContainer: لون اختياري يستخدم كلون للنص والرموز فوق tertiaryContainer.

error: اللون المستخدم لرسائل الخطأ أو العناصر التي تشير إلى وجود خطأ.

onError: اللون المستخدم للنص والرموز فوق اللون الخطأ.

errorContainer: لون اختياري يمكن استخدامه كلون خلفية للعناصر التي تشير إلى وجود خطأ.

onErrorContainer: لون اختياري يستخدم كلون للنص والرموز فوق errorContainer.

background: لون خلفية التطبيق أو واجهة المستخدم.

onBackground: اللون المستخدم للنص والرموز فوق خلفية التطبيق.

surface: لون خلفية العناصر السطحية مثل البطاقات والحوارات.

onSurface: اللون المستخدم للنص والرموز فوق لون السطح.

surfaceVariant: لون اختياري يستخدم لتلوين العناصر المرتفعة مثل الأزرار العائمة.

onSurfaceVariant: لون اختياري يستخدم للنص والرموز فوق surfaceVariant.

outline: اللون المستخدم للحدود والإطارات.

outlineVariant: لون اختياري يستخدم للحدود والإطارات للعناصر المرتفعة.

shadow: لون اختياري يستخدم للظلال.

scrim: لون اختياري يستخدم لتراكب عناصر أخرى مثل الحوارات.

inverseSurface: لون اختياري يستخدم للأسطح المقلوبة مثل العناصر المحددة.

onInverseSurface: لون اختياري يستخدم للنص والرموز فوق inverseSurface.

inversePrimary: لون اختياري يستخدم للعناصر الأساسية المقلوبة مثل الأزرار المحددة.

surfaceTint: لون اختياري يستخدم لتظليل الأسطح مثل البطاقات.
* */
class FormatColor {
  static const Color keyword = Colors.blue;
  static const Color string = Colors.green;
  static const Color comment = Colors.grey;
  static const Color number = Colors.orange;
  static const Color dataType = Colors.purple; // New color for data types
  static const Color classColor = Colors.teal; // New color for classes
  static const Color methodColor = Colors.indigo; // New color for methods/functions
}
