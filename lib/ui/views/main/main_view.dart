import 'package:spot/core/utils/exports.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => Scaffold(
        body: model.getViewForIndex(model.currentIndex),
        bottomNavigationBar: CurvedNavigationBar(
          items: model.items,
          index: model.currentIndex,
          onTap: model.setIndex,
          color: theme.colorScheme.secondary,
          backgroundColor: theme.backgroundColor,
          height: 60,
        ),
      ),
    );
  }
}
