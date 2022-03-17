import 'package:spot/core/utils/exports.dart';

// Text styles
const kHeadline1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);

const kHeadline2 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 20.0,
  letterSpacing: 0.4,
);

const kHeadline6 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 13.0,
  letterSpacing: 0.4,
);

const kSubtitle1 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15.0,
);

const kSubtitle2 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 12.0,
);

/// Adds a linear gradient which spans across a defined number of colors to a widget
const kLinearGradient = LinearGradient(
  colors: [
    Color(0xFFB181BF),
    Color(0xFF83AFE7),
  ],
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(1.0, 0.0),
  stops: [0.0, 1.0],
);

/// Creates a shader from a linear gradient to be used in a widget (e.g Text widget)
final kTextLinearGradient = const LinearGradient(
  colors: [
    Color(0xFFB181BF),
    Color(0xFF83AFE7),
  ],
).createShader(
  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

/// Adds "fake elevation" to containers since they do not have the elevation property by default
const kBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    spreadRadius: 1,
    blurRadius: 3,
    offset: Offset(0, 3),
  ),
];

final kTextInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide.none,
);
