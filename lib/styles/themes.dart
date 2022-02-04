import 'package:spot/core/utils/exports.dart';

//* Light
ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  // Accent color
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFCACACC),
    onSecondary: Colors.black,
    background: Colors.white,
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: Colors.black),
    subtitle2: kSubtitle2.copyWith(color: Colors.black),
  ),
  hintColor: Colors.black,
);

//* Dark
ThemeData darkTheme = ThemeData(
  backgroundColor: const Color(0xFF171923),
  // Accent color
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    background: Colors.black,
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: Colors.white),
    subtitle2: kSubtitle2.copyWith(color: Colors.white),
  ),
  hintColor: Colors.white,
);
