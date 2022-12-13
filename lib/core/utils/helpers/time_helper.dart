import 'package:intl/intl.dart';

class TimeHelper {
  static String formatDateTime(String dateString) {
    /// [dateString] should be in the same format as the one you set in [DateFormat] of [dateOfCreation] property below.
    /// In this case it is in the format ["dd-MM-yyyy h:mma"] which is equiavalent to a date like [01-01-2022 6:29AM]
    DateTime dateOfCreation = DateFormat('dd-MM-yyyy h:mma').parse(dateString);
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
      return '1 week ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return '1 day ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return '1 hour ago';
    } else if (difference.inMinutes >= 30) {
      return '~ 30 mins ago';
    } else if (difference.inMinutes >= 10) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 3) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 2) {
      return '~ 1 minute ago';
    } else if (difference.inMinutes >= 1) {
      return '1 minute ago';
    } else if (difference.inSeconds >= 5) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inSeconds >= 1) {
      return 'Just now';
    } else {
      return dateString;
    }
  }

  static String formatTimeInEpoch(int timestamp) {
    /// The number of milliseconds that have passed since the timestamp
    int difference = DateTime.now().millisecondsSinceEpoch - timestamp;
    String result;

    if (difference < 60000) {
      result = _countSeconds(difference);
    } else if (difference < 3600000) {
      result = _countMinutes(difference);
    } else if (difference < 86400000) {
      result = _countHours(difference);
    } else if (difference < 604800000) {
      result = _countDays(difference);
    } else if (difference / 1000 < 2419200) {
      result = _countWeeks(difference);
    } else if (difference / 1000 < 31536000) {
      result = _countMonths(difference);
    } else {
      result = _countYears(difference);
    }

    return !result.startsWith('J') ? '$result ago' : result;
  }

  /// Converts the time difference to a number of seconds.
  /// This function truncates to the lowest second.
  ///   returns ("Just now" OR "X seconds")
  static String _countSeconds(int difference) {
    int count = (difference / 1000).truncate();
    return count > 1 ? '$count seconds' : 'Just now';
  }

  /// Converts the time difference to a number of minutes.
  /// This function truncates to the lowest minute.
  ///   returns ("1 minute" OR "X minutes")
  static String _countMinutes(int difference) {
    int count = (difference / 60000).truncate();
    return count.toString() + (count > 1 ? ' minutes' : ' minute');
  }

  /// Converts the time difference to a number of hours.
  /// This function truncates to the lowest hour.
  ///   returns ("1 hour" OR "X hours")
  static String _countHours(int difference) {
    int count = (difference / 3600000).truncate();
    return count.toString() + (count > 1 ? ' hours' : ' hour');
  }

  /// Converts the time difference to a number of days.
  /// This function truncates to the lowest day.
  ///   returns ("1 day" OR "X days")
  static String _countDays(int difference) {
    int count = (difference / 86400000).truncate();
    return count.toString() + (count > 1 ? ' days' : ' day');
  }

  /// Converts the time difference to a number of weeks.
  /// This function truncates to the lowest week.
  ///   returns ("1 week" OR "X weeks" OR "1 month")
  static String _countWeeks(int difference) {
    int count = (difference / 604800000).truncate();
    if (count > 3) {
      return '1 month';
    }
    return count.toString() + (count > 1 ? ' weeks' : ' week');
  }

  /// Converts the time difference to a number of months.
  /// This function rounds to the nearest month.
  ///   returns ("1 month" OR "X months" OR "1 year")
  static String _countMonths(int difference) {
    int count = (difference / 2628003000).round();
    count = count > 0 ? count : 1;
    if (count > 12) {
      return '1 year';
    }
    return count.toString() + (count > 1 ? ' months' : ' month');
  }

  /// Converts the time difference to a number of years.
  /// This function truncates to the lowest year.
  ///   returns ("1 year" OR "X years")
  static String _countYears(int difference) {
    int count = (difference / 31536000000).truncate();
    return count.toString() + (count > 1 ? ' years' : ' year');
  }
}
