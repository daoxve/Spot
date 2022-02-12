import 'package:spot/core/models/recent_search.dart';
import 'package:spot/core/utils/exports.dart';
import 'package:spot/ui/shared/dialog.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  TextEditingController textController = TextEditingController();

  final popupItems = const [
    PopupMenuItem(
      value: 'about',
      child: Text('About'),
    ),
    // PopupMenuItem(
    //   value: 'rateApp',
    //   child: Text('Rate Our App'),
    // ),
  ];

  void popupValueActions(String result) {
    switch (result) {
      case 'about':
        navigateTo(Routes.aboutView);
        break;

      // TODO: Implement Rate App Functionality

      //  case 'rateApp':
      //   print('Rate App clicked');
      //   break;
    }
  }

  void saveSearch(BuildContext context) {
    RecentSearch recentSearch = RecentSearch(
      phoneNumber: textController.text,
      timeOfSearch: DateTime.now(),
    );

    if (textController.text.isNotEmpty) {
      HiveUtil.addData(recentSearch);
      print('Saved your input.');
      textController.clear();
    } else {
      _dialogService.showDialog(
        title: kInvalidNullActionTitle,
        description: kInvalidNullActionText,
      );
      // showAlertDialog(
      //   context: context,
      //   typeOfAlert: 'warning',
      //   navigateBack: navigateBack,
      // );
    }
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
