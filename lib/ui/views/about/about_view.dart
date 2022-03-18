import 'package:spot/core/utils/exports.dart';

import 'package:spot/ui/widgets/about/about_the_app.dart';
import 'package:spot/ui/widgets/about/disclaimer_card.dart';
import 'package:spot/ui/widgets/about/license_card.dart';
import 'package:spot/ui/widgets/about/version_card.dart';

import 'about_viewmodel.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: AboutViewMobile(model: model),
          tablet: AboutViewMobile(model: model),
          desktop: AboutViewDesktop(model: model),
        );
      },
    );
  }
}

class AboutViewDesktop extends StatelessWidget {
  const AboutViewDesktop({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AboutViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        iconTheme: theme.iconTheme,
        elevation: 0,
        leading: InkWell(
          onTap: model.navigateBack,
          borderRadius: BorderRadius.circular(100),
          child: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          'About',
          style: textTheme.headline1!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AboutTheApp(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DisclaimerCard(
                  theme: theme,
                  textTheme: textTheme,
                ),
                LicenseCard(
                  theme: theme,
                  textTheme: textTheme,
                ),
              ],
            ),
            VersionCard(
              theme: theme,
              textTheme: textTheme,
            ),
            Gap.mediumH,
            Text(
              '© David Coker.  2022.',
              style: textTheme.headline6,
            ),
            Gap.smallH,
          ],
        ),
      ),
    );
  }
}

class AboutViewMobile extends StatelessWidget {
  const AboutViewMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AboutViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        iconTheme: theme.iconTheme,
        elevation: 0,
        leading: InkWell(
          onTap: model.navigateBack,
          borderRadius: BorderRadius.circular(100),
          child: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          'About',
          style: textTheme.headline1!.copyWith(fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const AboutTheApp(),
            Gap.mediumH,
            DisclaimerCard(
              theme: theme,
              textTheme: textTheme,
            ),
            LicenseCard(
              theme: theme,
              textTheme: textTheme,
            ),
            VersionCard(
              theme: theme,
              textTheme: textTheme,
            ),
            Gap.mediumH,
            Text(
              '© David Coker.  2022.',
              style: textTheme.headline6,
            ),
            Gap.smallH,
          ],
        ),
      ),
    );
  }
}
