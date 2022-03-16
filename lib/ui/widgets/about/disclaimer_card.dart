import 'package:responsive_builder/responsive_builder.dart';
import 'package:spot/core/utils/exports.dart';

class DisclaimerCard extends StatelessWidget {
  const DisclaimerCard({
    Key? key,
    required this.theme,
    required this.textTheme,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getValueForScreenType<double>(
        context: context,
        mobile: 130.0,
        desktop: 250.0,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.maxFinite,
        desktop: 450.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
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
              width: getValueForScreenType<double>(
                context: context,
                mobile: 180.0,
                desktop: 250.0,
              ),
              height: 35.0,
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
