import 'package:spot/core/utils/exports.dart';

/// This function initializes all snackbars to be used later in the app.
void setupSnackbarUI() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcSuccess,
        backgroundColor: kcSuccess.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: CircleAvatar(
        radius: 15.r,
        backgroundColor: kcSuccess,
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      backgroundColor: kcSuccessAccent,
      titleColor: Colors.black,
      messageColor: Colors.black,
      mainButtonTextColor: kcSuccess,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      dismissDirection: DismissDirection.none,
      instantInit: true,
      shouldIconPulse: false,
      borderRadius: 15,
      overlayBlur: 2.0,
      barBlur: 10.0,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.failure,
    config: SnackbarConfig(
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
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
      icon: Icon(
        Icons.error_outline,
        size: 35.sp,
        color: kcError,
      ),
      backgroundColor: kcErrorAccent,
      mainButtonTextColor: kcError,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
