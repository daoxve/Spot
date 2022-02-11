import 'package:spot/core/utils/exports.dart';

import 'about_viewmodel.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        body: const Center(
          child: Text('About View'),
        ),
      ),
    );
  }
}
