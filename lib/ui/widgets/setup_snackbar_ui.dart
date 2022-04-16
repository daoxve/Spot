import 'package:spot/core/utils/exports.dart';

/// This function initializes all snackbars to be used later in the app.
/// TODO: Setup a custom snackbar for desktop.
void setupSnackbarUI() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      messageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcSuccess,
        backgroundColor: kcSuccess.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: const CircleAvatar(
        radius: 15.0,
        backgroundColor: kcSuccess,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      backgroundColor: kcSuccessAccent,
      titleColor: Colors.black,
      messageColor: Colors.black,
      mainButtonTextColor: kcSuccess,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      dismissDirection: DismissDirection.none,
      instantInit: true,
      shouldIconPulse: false,
      borderRadius: 15,
      overlayBlur: 2.0,
      barBlur: 10.0,
    ),
  );

  // Mobile
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.failure,
    config: SnackbarConfig(
      messageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcError,
        backgroundColor: kcError.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: const Icon(
        Icons.error_outline,
        size: 35.0,
        color: kcError,
      ),
      backgroundColor: kcErrorAccent,
      mainButtonTextColor: kcError,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.none,
      instantInit: true,
      borderRadius: 15,
      overlayBlur: 0.1,
      overlayColor: Colors.black26,
      shouldIconPulse: false,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
    ),
  );

  // Tablet
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.failureOnTablet,
    config: SnackbarConfig(
      messageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcError,
        backgroundColor: kcError.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: const Icon(
        Icons.error_outline,
        size: 35.0,
        color: kcError,
      ),
      backgroundColor: kcErrorAccent,
      mainButtonTextColor: kcError,
      margin: const EdgeInsets.symmetric(horizontal: 170.0, vertical: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.none,
      instantInit: true,
      borderRadius: 15,
      overlayBlur: 0.1,
      overlayColor: Colors.black26,
      shouldIconPulse: false,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
    ),
  );

  // Desktop
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.failureOnDesktop,
    config: SnackbarConfig(
      messageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcError,
        backgroundColor: kcError.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: const Icon(
        Icons.error_outline,
        size: 35.0,
        color: kcError,
      ),
      backgroundColor: kcErrorAccent,
      mainButtonTextColor: kcError,
      margin: const EdgeInsets.symmetric(horizontal: 400.0, vertical: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      snackPosition: kIsWeb ? SnackPosition.TOP : SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.none,
      instantInit: true,
      borderRadius: 15,
      overlayBlur: 0.1,
      overlayColor: Colors.black26,
      shouldIconPulse: false,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
    ),
  );
}
