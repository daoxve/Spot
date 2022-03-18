import 'package:spot/core/utils/exports.dart';

import 'package:spot/ui/widgets/home/app_bar.dart';
import 'package:spot/ui/widgets/home/desktop/app_bar_desktop.dart';
import 'package:spot/ui/widgets/home/desktop/intro_text_desktop.dart';
import 'package:spot/ui/widgets/home/intro_text.dart';
import 'package:spot/ui/widgets/home/result_card.dart';
import 'package:spot/ui/widgets/home/home_textfield.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.initFocusHelper(context),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: HomeViewMobile(model: model),
          desktop: HomeViewDesktop(model: model),
        );
      },
    );
  }
}

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () => model.initFocusHelper(context),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: HomeAppBarDesktop(
          theme: theme,
          toggleThemeFunction: () => model.toggleTheme(context),
          isDarkMode: model.isDarkMode(context),
          helpIconFunction: () => model.navigateTo(Routes.aboutView),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const IntroTextDesktop(),
              Gap.largeH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250.0),
                child: HomeTextField(
                  theme: theme,
                  textTheme: textTheme,
                  textController: model.textController,
                  onFieldSubmitted: (value) => model.getData(context),
                  suffixIconFunction: () => model.getData(context),
                ),
              ),
              Gap.largeH,
              const Text(
                'Results',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap.mediumH,
              SizedBox(
                width: 1080.0,
                child: ResultCard(theme: theme),
              ),
              Gap.mediumH,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '© David Coker.  2022.',
                  style: textTheme.headline6,
                ),
              ),
              Gap.mediumH,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: HeroTags.recents,
          onPressed: () => model.navigateTo(Routes.recentsView),
          child: const Icon(CupertinoIcons.square_list),
          backgroundColor: theme.colorScheme.background,
        ),
      ),
    );
  }
}

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () => model.initFocusHelper(context),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: HomeAppBar(
          theme: theme,
          toggleThemeFunction: () => model.toggleTheme(context),
          isDarkMode: model.isDarkMode(context),
          popupItemBuilder: (context) => model.popupItems,
          onPopupSelected: model.popupValueActions,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const IntroText(),
              Gap.mediumH,
              HomeTextField(
                theme: theme,
                textTheme: textTheme,
                textController: model.textController,
                onFieldSubmitted: (value) => model.getData(context),
                suffixIconFunction: () => model.getData(context),
              ),
              Gap.largeH,
              const Text(
                'Results',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap.mediumH,
              ResultCard(theme: theme),
              Gap.mediumH,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '© David Coker.  2022.',
                  style: textTheme.headline6,
                ),
              ),
              Gap.mediumH,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: HeroTags.recents,
          onPressed: () => model.navigateTo(Routes.recentsView),
          child: const Icon(CupertinoIcons.square_list),
          backgroundColor: theme.colorScheme.background,
        ),
      ),
    );
  }
}
