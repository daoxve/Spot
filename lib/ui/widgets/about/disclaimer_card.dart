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
            'Disclaimer:',
            style: textTheme.headline6,
          ),
          Gap.smallH,
          GestureDetector(
            onTap: () async {
              final url = Uri.parse('https://daoxve.github.io/Spot/DISCLAIMER.html');

              if (await canLaunchUrl(url)) {
                await launchUrl(url, webOnlyWindowName: 'Spot');
              } else {
                throw 'Could not launch $url';
              }
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: 220.0,
                  desktop: 250.0,
                ),
                height: 35.0,
                decoration: BoxDecoration(
                  gradient: kLinearGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Read Our Official Disclaimer',
                    style: textTheme.headline6!.copyWith(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
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
