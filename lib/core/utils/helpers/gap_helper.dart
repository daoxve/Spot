import 'package:spot/core/utils/exports.dart';

/// A helper class that helps for cleaner looking whitespaces
///
/// W => Width and H => Height
class Gap {
  Widget tinyW = SizedBox(width: 5.w);
  Widget tinyH = SizedBox(height: 5.h);
  Widget smallW = SizedBox(width: 10.w);
  Widget smallH = SizedBox(height: 10.h);
  Widget regularW = SizedBox(width: 18.w);
  Widget regularH = SizedBox(height: 18.h);
  Widget mediumW = SizedBox(width: 25.w);
  Widget mediumH = SizedBox(height: 25.h);
  Widget largeW = SizedBox(width: 38.w);
  Widget largeH = SizedBox(height: 38.h);
  Widget whiteSpaceW = SizedBox(width: 50.w);
  Widget whiteSpaceH = SizedBox(height: 50.h);
}
