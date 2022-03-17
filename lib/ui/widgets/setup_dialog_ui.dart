import 'package:spot/core/utils/exports.dart';

import 'dialogs/confirmation_dialog.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.confirmation: (context, sheetRequest, completer) =>
        ConfirmationDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
