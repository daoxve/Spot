import 'package:spot/core/utils/exports.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  Site? searchResult;
  bool isLoading = false;

  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  final _snackbarWrapperService = locator<SnackbarWrapperService>();

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
        snackbarService: _snackbarWrapperService,
      );

      final jsonData = Site.fromJson(data);

      if (jsonData.domain == null) {
        _snackbarWrapperService.pushCustomPopup(
          context,
          message: kNotInDatabase,
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

      _snackbarWrapperService.pushCustomPopup(
        context,
        message: kCantDoThat,
      );

      textController.clear();

      log.e('Oops! $e');

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();

      _snackbarWrapperService.pushCustomPopup(
        context,
        message: kSomethingWentWrong,
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
      _snackbarWrapperService.pushCustomPopup(
        context,
        message: kRequiredActionText,
      );

      isLoading = false;
      notifyListeners();

      return false;
    } else if (textController.text.contains('google.com') ||
        textController.text.contains('microsoft.com')) {
      initFocusHelper(context);
      _snackbarWrapperService.pushCustomPopup(
        context,
        buttonText: 'Got It',
        message: kUnsupportedSite,
      );

      isLoading = false;
      notifyListeners();

      return false;
    }

    return true;
  }
}
