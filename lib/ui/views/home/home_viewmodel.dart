import 'package:dio/dio.dart';
import 'package:spot/core/models/site/site.dart';
import 'package:spot/core/utils/exports.dart';

import 'package:spot/core/models/search/search.dart';
import 'package:spot/core/services/dio_client.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  Site? searchResult;
  bool isLoading = false;

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final DioClient dioHelper = DioClient();

  List<Group> siteGroups = [];
  List<int> liveTechList = [];
  List<int> deadTechList = [];
  int totalLiveTech = 0;
  int totalDeadTech = 0;

  TextEditingController textController = TextEditingController();

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

    final key = dotenv.env['KEY'];

    try {
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

        return;
      }

      final data = await dioHelper.getData(
        url: 'https://api.builtwith.com/free1/api.json?KEY=$key&LOOKUP=${textController.text}',
        context: context,
        snackbarService: _snackbarService,
        onSnackbarTap: navigateBack,
      );

      final jsonData = Site.fromJson(data);
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

      log.e('An Exception! $e');

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
        message: 'No internet connection.',
        variant: SnackbarType.failure,
      );
      textController.clear();

      log.e('Oops! $e');
    }

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
}
