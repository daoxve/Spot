import 'package:spot/core/utils/exports.dart';

// An example of using the alert dialog
// showAlertDialog(
//  context: context,
//  typeOfAlert: 'positive',
//  navigateBack: model.navigateBack,
// );

showAlertDialog({
  required BuildContext context,
  required String? typeOfAlert,
  String? alertText,
  required Function() navigateBack,
}) {
  String defaultText = "Message that takes 2 lines to explain and goes on";

  AlertDialog alert = AlertDialog(
    backgroundColor: getColor(typeOfAlert!).withOpacity(0.8),
    insetPadding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
      side: BorderSide.none,
    ),
    alignment: const Alignment(0.0, 1.0),
    contentPadding:
        const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
    contentTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: getTextColor(typeOfAlert),
    ),
    content: Row(
      children: [
        getIcon(typeOfAlert),
        const SizedBox(width: 12),
        Expanded(
          child: Text(alertText ?? defaultText),
        ),
        GestureDetector(
          onTap: navigateBack,
          child: Icon(
            Icons.close,
            color: getTextColor(typeOfAlert),
          ),
        ),
      ],
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Method to return color based on string passed
Color getColor(String type) {
  switch (type) {
    case 'positive':
      return const Color(0xff05944F);
    case 'positiveLight':
      return const Color(0xffE6F2ED);
    case 'negative':
      return const Color(0xffE11900);
    case 'negativeLight':
      return const Color(0xffFFEFED);
    case 'warning':
      return const Color(0xffFFC043);
    case 'warningLight':
      return const Color(0xffFFFAF0);
    case 'accent':
      return const Color(0xff276EF1);
    case 'accentLight':
      return const Color(0xffEFF3FE);
    default:
      return const Color(0xff276EF1);
  }
}

// Method to return text color based on string passed
Color getTextColor(String type) {
  switch (type) {
    case 'positive':
    case 'negative':
    case 'accent':
      return const Color(0xffFFFFFF);
    case 'warning':
    case 'positiveLight':
    case 'negativeLight':
    case 'warningLight':
    case 'accentLight':
      return const Color(0xff000000);
    default:
      return const Color(0xffFFFFFF);
  }
}

// Method to return icon color based on string passed
Color getIconColor(String type) {
  switch (type) {
    case 'positive':
    case 'accent':
    case 'negative':
      return const Color(0xffFFFFFF);
    case 'warning':
    case 'positiveLight':
    case 'negativeLight':
    case 'warningLight':
    case 'accentLight':
      return const Color(0xff000000);
    default:
      return const Color(0xffFFFFFF);
  }
}

// Method to return icon based on string passed
Icon getIcon(String type) {
  switch (type) {
    case 'accent':
    case 'accentLight':
      return Icon(
        Icons.error,
        color: getIconColor(type),
      );
    case 'positive':
    case 'positiveLight':
      return Icon(
        Icons.check_box,
        color: getIconColor(type),
      );
    case 'warning':
    case 'warningLight':
      return Icon(
        Icons.warning,
        color: getIconColor(type),
      );
    case 'negative':
    case 'negativeLight':
      return Icon(
        Icons.error,
        color: getIconColor(type),
      );
    default:
      return Icon(
        Icons.error,
        color: getIconColor(type),
      );
  }
}
