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
        bottomNavigationBar: BottomNavigationBar(
          items: model.items,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          type: BottomNavigationBarType.fixed,
          // fixedColor: theme.colorScheme.background,
          selectedItemColor: theme.iconTheme.color,
          unselectedItemColor: theme.iconTheme.color!.withOpacity(0.4),
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          backgroundColor: theme.backgroundColor,
        ),
      ),
    );
  }
}
