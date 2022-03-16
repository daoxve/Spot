import 'package:spot/core/utils/exports.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({
    Key? key,
    required this.theme,
    required this.textTheme,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: kBoxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Disclaimer:',
            style: textTheme.headline6,
          ),
          Gap.smallH,
          Link(
            target: LinkTarget.self,
            uri: Uri.parse('https://cokerdavid.com/Spot/DISCLAIMER.html'),
            builder: (context, followLink) => Container(
              width: 180.w,
              height: 35.h,
              decoration: BoxDecoration(
                gradient: kLinearGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: followLink,
                child: Center(
                  child: Text(
                    'Read Our Official Disclaimer',
                    style: textTheme.headline6!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
