import 'package:spot/core/utils/exports.dart';

class RecentsViewModel extends BaseViewModel {
  late final Box box;

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future<dynamic> initHiveBox() async {
    box = Hive.box(HiveBoxes.searchBox);
    return box;
  }

  void insertAtIndex(int index) {
    HiveUtil.insertAtIndex(index);
  }

  void showConfirmationDialog() async {
    final dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      customData: DialogStatus.warning,
      barrierDismissible: true,
      title: kConfirmationTitle,
      description: kConfirmationText,
      mainButtonTitle: 'Yeah, totally',
      secondaryButtonTitle: 'Nope',
    );

    if (dialogResponse?.confirmed == true) {
      HiveUtil.deleteAllData();
    }
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }
}
