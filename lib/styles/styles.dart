import 'package:spot/core/utils/exports.dart';

const Color kcRed = Color(0xFFCC2212);
const Color kcLightRed = Color(0xFFFBE6E5);
const Color kcOrangeColor = Color(0xffff9800);
const Color kcGreen = Color(0xFF3D8B27);
const Color kcLightGreen = Color(0xFFDDFEE2);

final kTextLinearGradient = const LinearGradient(
  colors: [
    Color(0xFFB181BF),
    Color(0xFF83AFE7),
  ],
).createShader(
  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

const kLinearGradient = LinearGradient(
  colors: [
    Color(0xFFB181BF),
    Color(0xFF83AFE7),
  ],
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(1.0, 0.0),
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

final kTextInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide.none,
);

// Default text styles
final kHeadline1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.sp,
);

final kHeadline6 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 13.sp,
  letterSpacing: 0.4,
);

final kSubtitle1 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15.sp,
);

final kSubtitle2 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 12.sp,
);
