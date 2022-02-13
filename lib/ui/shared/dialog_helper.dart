import 'package:spot/core/utils/exports.dart';

// enu variantItems {}
final DialogService _dialogService = locator<DialogService>();

appDialog({
  bool isDismissible = true,
}) {
  _dialogService.showCustomDialog(
    // barrierDismissible: isDismissible,
    // title: ,
    // description:,
    // variant: ,


  );
}
