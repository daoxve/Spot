import 'package:spot/core/models/recent_search.dart';
import 'package:spot/core/utils/exports.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController textController = TextEditingController();

  void saveSearch(BuildContext context) {
    RecentSearch recentSearch = RecentSearch(
      phoneNumber: textController.text,
    );

    HiveStore.addDataToHive(recentSearch.phoneNumber);
    print('Saved your input.');
    textController.clear();
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  void initFocusHelper(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void toggleTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme();
  }

  bool isDarkMode(BuildContext context) {
    final result = getThemeManager(context).isDarkMode;
    return result;
  }
}
