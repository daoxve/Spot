import 'package:spot/core/utils/exports.dart';

class VersionCard extends StatelessWidget {
  const VersionCard({
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
        tablet: 180.0,
        desktop: 250.0,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.maxFinite,
        tablet: 350.0,
        desktop: 450.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: kBoxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Version',
            style: textTheme.headline6,
          ),
          Gap.smallH,
          Text(
            appVersionNumber,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
