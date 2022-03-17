import 'package:spot/core/utils/exports.dart';

import 'labelled_avatar.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: getValueForScreenType<double>(
        context: context,
        mobile: 310.0,
        desktop: 350.0,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.maxFinite,
        desktop: 500.0,
      ),
      child: Card(
        elevation: 4,
        color: theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const LabelledAvatar(
                imagePath: 'assets/logo/spot.png',
                label: 'Spot',
                labelSize: 14.0,
              ),
              Gap.smallH,
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: getValueForScreenType<double>(
                      context: context,
                      mobile: 420,
                      desktop: null,
                    ),
                  ),
                  child: Text(
                    kAboutTheApp,
                    style: TextStyle(
                      color: theme.iconTheme.color!.withOpacity(0.8),
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                      wordSpacing: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
