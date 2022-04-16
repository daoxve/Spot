import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/services/network_service.dart';
import '../core/services/snackbar_wrapper_service.dart';

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
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: SnackbarWrapperService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
