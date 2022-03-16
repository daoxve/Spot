import 'package:spot/core/utils/exports.dart';

class IntroTextDesktop extends StatelessWidget {
  const IntroTextDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lookup details',
              style: TextStyle(
                fontSize: 46.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              '  for any website.',
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w900,
                foreground: Paint()..shader = kTextLinearGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
