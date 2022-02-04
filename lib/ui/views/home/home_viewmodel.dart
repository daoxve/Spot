import 'package:spot/core/utils/exports.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController textController = TextEditingController();
  List<String> recentSearches = ['douf', 'west'];

  void navigateBack() {
    _navigationService.back();
  }

  void saveRecentSearches(BuildContext context) {
    recentSearches.add(textController.text);
    print('saved');
    print(textController.text);
    notifyListeners();
    // textController.clear();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  // void pushDataToRoute(BuildContext context, String route) {
  //   final String enteredNumber = textController.text;

  //   _navigationService.navigateTo(route, arguments: enteredNumber);
  // }

  // void disposeAll() {
  //   textController.dispose();
  // }

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
