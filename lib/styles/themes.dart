import 'package:spot/core/utils/exports.dart';

//* Light
ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  // Accent color
  colorScheme: ColorScheme.fromSwatch().copyWith(
    // secondary: const Color(0xFFCACACC),
    secondary: Colors.black12,
    onSecondary: Colors.black,
    background: const Color(0xFFF6F7FE),
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: Colors.black),
    headline6: kHeadline6.copyWith(color: const Color(0xFF5B5EA6)),
    subtitle1: kSubtitle1.copyWith(color: const Color(0xFF6C6C6C)),
    subtitle2: kSubtitle2.copyWith(color: Colors.black54),
  ),
  hintColor: Colors.black,
);

//* Dark
ThemeData darkTheme = ThemeData(
  backgroundColor: const Color(0xFF22242C),
  // Accent color
  colorScheme: ColorScheme.fromSwatch().copyWith(
    // secondary: const Color(0xFF5B5EA6),
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
  hintColor: Colors.white,
);
