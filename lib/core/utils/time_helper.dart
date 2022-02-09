import 'package:intl/intl.dart';

class TimeHelper {
  static String currentDate(String dateString, {bool numericDates = true}) {
    /// [dateString] should be in the same format as the one you set in [DateFormat] of [dateOfCreation] property below.
    /// In this case it is in the format ["dd-MM-yyyy h:mma"] which is equiavalent to a date like [01-01-2022 6:29AM]
    DateTime dateOfCreation = DateFormat("dd-MM-yyyy h:mma").parse(dateString);
    final timeNow = DateTime.now();
    final difference = timeNow.difference(dateOfCreation);

    if (difference.inDays > 30) {
      return 'A while ago';
    } else if (difference.inDays > 21) {
      return 'Almost a month ago';
    } else if (difference.inDays > 14) {
      return 'Three weeks ago';
    } else if (difference.inDays > 7) {
      return 'Two weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 10) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 3) {
      return 'A few minutes ago';
    } else if (difference.inMinutes >= 2) {
      return 'More than a minute ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 5) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inSeconds >= 1) {
      return 'Just now';
    } else {
      return dateString;
    }
  }
}
