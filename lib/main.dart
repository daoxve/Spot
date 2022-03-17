import 'core/utils/exports.dart';
import 'styles/themes.dart' as _themes;

import 'package:spot/core/models/search/search.dart';

import 'ui/widgets/setup_dialog_ui.dart';
import 'ui/widgets/setup_snackbar_ui.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SearchAdapter());
  await Hive.openBox(HiveBoxes.searchBox);

  await dotenv.load();

  setupLocator();
  setupSnackbarUI();
  setupDialogUI();
  await ThemeManager.initialise();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (_) => Colors.transparent,
      navigationBarColorBuilder: (theme) => theme!.colorScheme.background,
      defaultThemeMode: ThemeMode.dark,
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
        // home: const HomeView(),
      ),
    );
  }
}
