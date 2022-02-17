import 'package:spot/core/utils/exports.dart';

//* Light
ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.black12,
    onSecondary: Colors.black,
    background: const Color(0xFFF6F7FE),
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: Colors.black),
    headline6: kHeadline6.copyWith(color: Colors.black),
    subtitle1: kSubtitle1.copyWith(color: const Color(0xFF6C6C6C)),
    subtitle2: kSubtitle2.copyWith(color: Colors.black54),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: const Color(0xFFF6F7FE),
  ),
  hintColor: Colors.black,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

//* Dark
ThemeData darkTheme = ThemeData(
  backgroundColor: const Color(0xFF22242C),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF16181D),
    onSecondary: Colors.white,
    background: const Color(0xFF16181D),
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: Colors.white),
    headline6: kHeadline6.copyWith(color: Colors.white),
    subtitle1: kSubtitle1.copyWith(color: Colors.white),
    subtitle2: kSubtitle2.copyWith(color: Colors.white54),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    enableFeedback: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: const Color(0xFF16181D),
  ),
  hintColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);
