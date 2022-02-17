import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/exports.dart';
import 'styles/themes.dart' as _themes;

import 'package:spot/core/models/recent_search.dart';

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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => ThemeBuilder(
        statusBarColorBuilder: (theme) => theme!.backgroundColor,
        navigationBarColorBuilder: (theme) => theme!.backgroundColor,
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
