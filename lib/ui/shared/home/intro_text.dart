import 'package:spot/core/utils/exports.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lookup details',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'for any website.',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w900,
              foreground: Paint()..shader = kTextLinearGradient,
            ),
          ),
        ],
      ),
    );
  }
}
