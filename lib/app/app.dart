//*************************************************************************** */
// flutter packages pub run build_runner build --delete-conflicting-outputs
//*************************************************************************** */

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/recents/recents_view.dart';
import '../ui/views/about/about_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView, initial: true),
    CupertinoRoute(page: RecentsView),
    CupertinoRoute(page: AboutView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
