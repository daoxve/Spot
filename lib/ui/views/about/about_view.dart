import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/shared/about/app_bar.dart';

import 'about_viewmodel.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AboutAppBar(theme: theme, textTheme: textTheme, model: model),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // About The App
                SizedBox(
                  height: 310.h,
                  child: Card(
                    elevation: 4,
                    color: theme.colorScheme.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                      child: Column(
                        // direction: Axis.vertical,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabeledAvatar(
                            theme: theme,
                            textTheme: textTheme,
                            imagePath: 'assets/images/logo/spot.png',
                            isImageDark: model.isDarkMode(context),
                            label: 'Spot',
                          ),
                          Gap().smallH,
                          Flexible(
                            flex: 1,
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
                ),

                // Whitespace
                Gap().mediumH,

                // About The Developer
                Card(
                  elevation: 4,
                  color: theme.colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabeledAvatar(
                          theme: theme,
                          textTheme: textTheme,
                          imagePath: 'assets/images/logo/spot.png',
                          isImageDark: model.isDarkMode(context),
                          label: 'Spot',
                        ),
                        Gap().mediumW,
                        Flexible(
                          flex: 1,
                          child: Text(
                            kAboutTheApp,
                            style: TextStyle(
                              color: theme.iconTheme.color!.withOpacity(0.8),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8,
                              wordSpacing: 1.15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // More whitespace
                Gap().mediumH,

                // Disclaimer
                SizedBox(
                  height: 900.h,
                  child: Card(
                    elevation: 4,
                    color: theme.colorScheme.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Disclaimer',
                            style: textTheme.headline6,
                          ),
                          Gap().smallH,
                          Flexible(
                            flex: 1,
                            child: Text(
                              '',
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LabeledAvatar extends StatelessWidget {
  const LabeledAvatar({
    Key? key,
    required this.theme,
    required this.textTheme,
    required this.isImageDark,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final ThemeData theme;
  final TextTheme textTheme;
  final bool isImageDark;
  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    final logoImage = ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );

    return Column(
      children: [
        Container(
          width: 80.w,
          height: 85.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.background,
              width: 1.8.w,
            ),
            shape: BoxShape.circle,
          ),
          child: isImageDark ? logoImage : ColorInverter(child: logoImage),
        ),
        Gap().smallH,
        Text(
          label,
          style: textTheme.headline6,
        ),
      ],
    );
  }
}
