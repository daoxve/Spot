import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/shared/home/app_bar.dart';
import 'package:spot/ui/shared/home/intro_text.dart';
import 'package:spot/ui/shared/home/phone_number_results.dart';
import 'package:spot/ui/shared/home/phone_number_textfield.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.initFocusHelper(context),
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: HomeAppBar(
            theme: theme,
            model: model,
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            children: [
              const IntroText(),
              Gap().mediumH,
              PhoneNumberTextField(
                theme: theme,
                textTheme: textTheme,
                model: model,
              ),
              Gap().largeH,
               Text(
                'Results',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap().mediumH,
              PhoneNumberResults(theme: theme)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.navigateTo(Routes.recentsView),
            child: const Icon(CupertinoIcons.square_list),
            backgroundColor: theme.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
