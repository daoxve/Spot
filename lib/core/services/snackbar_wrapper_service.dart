import 'package:spot/core/utils/exports.dart';

/// A thin wrapper around the [SnackbarService] to allow responsiveness
class SnackbarWrapperService {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  void pushCustomPopup(
    BuildContext context, {
    String? buttonText,
    required String message,
    bool isSuccess = false,
  }) {
    _snackbarService.showCustomSnackBar(
      mainButtonTitle: buttonText ?? 'Okay',
      onMainButtonTapped: _navigationService.back,
      onTap: _navigationService.back,
      duration: const Duration(seconds: 3),
      message: message,
      variant: isSuccess
          ? getValueForScreenType<SnackbarType>(
              context: context,
              mobile: SnackbarType.success,
              tablet: SnackbarType.success,
              desktop: SnackbarType.success,
            )
          : getValueForScreenType<SnackbarType>(
              context: context,
              mobile: SnackbarType.failure,
              tablet: SnackbarType.failureOnTablet,
              desktop: SnackbarType.failureOnDesktop,
            ),
    );
  }
}
