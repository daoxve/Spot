import 'package:spot/core/utils/exports.dart';

//* Light
ThemeData lightTheme = ThemeData(
  backgroundColor: kcWhite,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kcBlack12,
    onSecondary: kcBlack,
    primaryVariant: kcLightVar,
    secondaryVariant: kcLightVarAccent,
    background: kcWhiteBackground,
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: kcBlack),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: kcBlack),
    headline2: kHeadline2.copyWith(color: kcBlack),
    headline6: kHeadline6.copyWith(color: kcBlack),
    subtitle1: kSubtitle1.copyWith(color: kcGrey),
    subtitle2: kSubtitle2.copyWith(color: kcBlack54),
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
  backgroundColor: kcDark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kcDarkAccent,
    onSecondary: kcWhite,
    primaryVariant: kcDarkVar,
    secondaryVariant: kcDarkVarAccent,
    background: kcDarkAccent,
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: kcWhite),
  textTheme: TextTheme(
    headline1: kHeadline1.copyWith(color: kcWhite),
    headline2: kHeadline2.copyWith(color: kcWhite),
    headline6: kHeadline6.copyWith(color: kcWhite),
    subtitle1: kSubtitle1.copyWith(color: kcWhite),
    subtitle2: kSubtitle2.copyWith(color: kcWhite54),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 2,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    color: kcDarkAccent,
  ),
  hintColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);
