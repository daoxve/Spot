import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/recents/recents_view.dart';
import '../ui/views/about/about_view.dart';

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, initial: true),
    CustomRoute(page: RecentsView),
    CustomRoute(page: AboutView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
