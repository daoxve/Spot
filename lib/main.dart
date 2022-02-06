import 'package:spot/core/utils/hive_boxes.dart';

import 'core/utils/exports.dart';
import 'styles/themes.dart' as _themes;

import 'package:spot/core/models/recent_search.dart';

import './ui/views/main/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RecentSearchAdapter());
  await Hive.openBox(HiveBoxes.searchStorageBox);

  setupLocator();
  await ThemeManager.initialise();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.backgroundColor,
      navigationBarColorBuilder: (theme) => theme!.backgroundColor,
      defaultThemeMode: ThemeMode.light,
      darkTheme: _themes.darkTheme,
      lightTheme: _themes.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Spot',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        home: const MainView(),
      ),
    );
  }
}
