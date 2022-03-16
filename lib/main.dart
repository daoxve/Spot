import 'core/utils/exports.dart';
import 'styles/themes.dart' as _themes;

import 'package:spot/core/models/search/search.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SearchAdapter());
  await Hive.openBox(HiveBoxes.searchBox);

  await dotenv.load();

  setupLocator();
  await ThemeManager.initialise();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => ThemeBuilder(
        statusBarColorBuilder: (_) => Colors.transparent,
        navigationBarColorBuilder: (theme) => theme!.colorScheme.background,
        defaultThemeMode: ThemeMode.dark,
        darkTheme: _themes.darkTheme,
        lightTheme: _themes.lightTheme,
        builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          title: 'Spot',
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          // home: const HomeView(),
        ),
      ),
    );
  }
}
