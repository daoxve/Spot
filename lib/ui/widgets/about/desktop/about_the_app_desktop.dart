import 'package:spot/core/utils/exports.dart';

import '../labelled_avatar.dart';

class AboutTheAppDesktop extends StatelessWidget {
  const AboutTheAppDesktop({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.isLogoDark,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final bool isLogoDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      height: 500,
      child: Card(
        elevation: 4,
        color: theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Flex(
            direction: Axis.vertical,
            children: [
              LabelledAvatar(
                theme: theme,
                textTheme: textTheme,
                imagePath: 'assets/logo/spot.png',
                isImageDark: isLogoDark,
                label: 'Spot',
                labelSize: 14.sp,
              ),
              Gap.smallH,
              Flexible(
                child: Text(
                  kAboutTheApp,
                  style: TextStyle(
                    color: theme.iconTheme.color!.withOpacity(0.8),
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.4,
                    wordSpacing: 1.15,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
