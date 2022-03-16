import 'package:spot/core/utils/exports.dart';

class AboutViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  bool isDarkMode(BuildContext context) {
    final result = getThemeManager(context).isDarkMode;
    return result;
  }
}
