import 'package:spot/core/utils/exports.dart';

class LicenseCard extends StatelessWidget {
  const LicenseCard({
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
        mobile: 140.0,
        tablet: 170.0,
        desktop: 250.0,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.maxFinite,
        tablet: 350.0,
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
            'License:',
            style: textTheme.headline6,
          ),
          Gap.smallH,
          Text(
            'BSD 3-Clause License',
            style: textTheme.headline6,
          ),
          Gap.smallH,
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final url = Uri.parse('https://github.com/daoxve/Spot/blob/master/LICENSE');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: 80.0,
                  desktop: 150.0,
                ),
                height: 35.0,
                decoration: BoxDecoration(
                  gradient: kLinearGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'See more',
                    style: textTheme.headline6!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
