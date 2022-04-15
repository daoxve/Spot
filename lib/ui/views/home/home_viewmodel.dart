import 'package:dio/dio.dart';
import 'package:spot/core/models/site/site.dart';
import 'package:spot/core/utils/exports.dart';

import 'package:spot/core/models/search/search.dart';
import 'package:spot/core/services/network_service.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  Site? searchResult;
  bool isLoading = false;

  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _networkService = locator<NetworkService>();

  final textController = TextEditingController();

  List<Group> siteGroups = [];
  List<int> liveTechList = [];
  List<int> deadTechList = [];
  int totalLiveTech = 0;
  int totalDeadTech = 0;

  final popupItems = const [
    PopupMenuItem(
      value: 'about',
      child: Text('About'),
    ),
  ];

  void popupValueActions(String result) {
    switch (result) {
      case 'about':
        navigateTo(Routes.aboutView);
        break;
    }
  }

  void getData(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final _continues = await validateTextActionsAndContinue(context);
      if (_continues != true) return;

      final data = await _networkService.getData(
        url: 'https://api.builtwith.com/free1/api.json?KEY=$key&LOOKUP=${textController.text}',
        context: context,
        snackbarService: _snackbarService,
        onSnackbarTap: navigateBack,
      );

      final jsonData = Site.fromJson(data);
      
      if (jsonData.domain == null) {
        _snackbarService.showCustomSnackBar(
          mainButtonTitle: 'Okay',
          onMainButtonTapped: navigateBack,
          onTap: navigateBack,
          duration: const Duration(seconds: 3),
          message: kNotInDatabase,
          variant: SnackbarType.failure,
        );
      }

      siteGroups.addAll(jsonData.groups?.toList() ?? []);

      getLiveTech();
      getDeadTech();
      log.i('Success: Data retrieved successfully');

      searchResult = jsonData;

      _saveSearch(context);
      notifyListeners();
    } on DioError catch (e) {
      isLoading = false;
      notifyListeners();

      _snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: navigateBack,
        onTap: navigateBack,
        duration: const Duration(seconds: 3),
        message: 'Oops! You can\'t do that.',
        variant: SnackbarType.failure,
      );
      textController.clear();

      log.e('Oops! $e');

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();

      _snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: navigateBack,
        onTap: navigateBack,
        duration: const Duration(seconds: 3),
        message: 'Oops. Something went wrong.',
        variant: SnackbarType.failure,
      );

      log.e('Oops! $e');
    }

    textController.clear();
    isLoading = false;
    notifyListeners();
  }

  int getLiveTech() {
    for (Group groups in siteGroups) {
      liveTechList.add(groups.live);
    }

    totalLiveTech = liveTechList.fold(0, (p, c) => p + c);

    log.i('List of live tech: $liveTechList');
    log.i('Live tech count is $totalLiveTech');
    notifyListeners();

    return totalLiveTech;
  }

  int getDeadTech() {
    for (Group groups in siteGroups) {
      deadTechList.add(groups.dead);
    }

    totalDeadTech = deadTechList.fold(0, (p, c) => p + c);

    log.i('List of dead tech: $deadTechList');
    log.i('Dead tech count is $totalDeadTech');
    notifyListeners();

    return totalDeadTech;
  }

  void _saveSearch(BuildContext context) {
    Search newSearch = Search(
      searchedURL: textController.text,
      timeOfSearch: DateTime.now(),
    );

    HiveUtil.addData(newSearch);

    log.i('Saved your input at ${newSearch.timeOfSearch}');
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
    if (getThemeManager(context).selectedThemeMode == ThemeMode.dark) {
      getThemeManager(context).setThemeMode(ThemeMode.light);
    } else {
      getThemeManager(context).setThemeMode(ThemeMode.dark);
    }
  }

  bool isDarkMode(BuildContext context) {
    final result = getThemeManager(context).isDarkMode;
    return result;
  }

  Future<bool> validateTextActionsAndContinue(context) async {
    if (textController.text.isEmpty) {
      initFocusHelper(context);
      _snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Okay',
        onMainButtonTapped: navigateBack,
        onTap: navigateBack,
        duration: const Duration(seconds: 3),
        message: kRequiredActionText,
        variant: SnackbarType.failure,
      );

      isLoading = false;
      notifyListeners();

      return false;
    } else if (textController.text.contains('google.com') ||
        textController.text.contains('microsoft.com')) {
      initFocusHelper(context);
      _snackbarService.showCustomSnackBar(
        mainButtonTitle: 'Got It',
        onMainButtonTapped: navigateBack,
        onTap: navigateBack,
        duration: const Duration(seconds: 3),
        message: kUnsupportedSite,
        variant: SnackbarType.failure,
      );

      isLoading = false;
      notifyListeners();

      return false;
    }

    return true;
  }
}
