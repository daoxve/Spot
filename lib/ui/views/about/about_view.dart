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
      builder: (context, model, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AboutAppBar(theme: theme, textTheme: textTheme, model: model),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This App',
                style: textTheme.headline6,
              ),
              Gap().smallH,
              Container(
                height: 600.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                // child: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
