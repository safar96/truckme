import 'package:easy_localization/easy_localization.dart';

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

String getTimeL(String time) {
  try {
    DateFormat format = DateFormat("d MMMM yyyy HH:mm", "en");
    String month = months.firstWhere((element) => element.contains(time.split(" ")[1]));
    var day = time.split(" ")[2];
    var year = time.split(" ")[3];
    var date = time.split(" ")[4];
    var dateTime = DateTime.parse(format.parse("$day $month $year $date").toString()).add(const Duration(hours: 5));
    return "${dateTime.day.toString().padLeft(2, "0")}.${dateTime.month.toString().padLeft(2, "0")}.${dateTime.year} ${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}";
  } catch (e) {
    return time;
  }
}

bool isNewVideo(String time) {
  try {
    DateFormat format = DateFormat("d MMMM yyyy HH:mm", "en");
    String month = months.firstWhere((element) => element.contains(time.split(" ")[1]));
    var day = time.split(" ")[2];
    var year = time.split(" ")[3];
    var date = time.split(" ")[4];
    var dateTime =
        DateTime.parse(format.parse("$day $month $year $date").toString()).add(const Duration(hours: 5, days: 3));
    return DateTime.now().isBefore(dateTime);
  } catch (e) {
    return false;
  }
}

String formattedTime({required int timeInSecond}) {
  try {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    int h = 0;
    if (min > 60) {
      h = (min / 60).floor();
      min = min % 60;
    }
    String hour = h.toString().length <= 1 ? "0$h" : "$h";
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    if (h > 0) {
      return "$hour : $minute : $second";
    } else {
      return "$minute : $second";
    }
  } catch (e) {
    return "00:00";
  }
}

extension StringExtension on String {
  static String displayTimeAgoFromTimestamp(String time) {
    try {
      DateFormat format = DateFormat("d MMMM yyyy HH:mm", "en");
      String month1 = months.firstWhere((element) => element.contains(time.split(" ")[1]));
      var day1 = time.split(" ")[2];
      var year1 = time.split(" ")[3];
      var date1 = time.split(" ")[4];
      var dateTime1 =
          DateTime.parse(format.parse("$day1 $month1 $year1 $date1").toString()).add(const Duration(hours: 5));

      final year = dateTime1.year;
      final month = dateTime1.month;
      final day = dateTime1.day;
      final hour = dateTime1.hour;
      final minute = dateTime1.minute;

      final DateTime videoDate = DateTime(year, month, day, hour, minute);
      final int diffInHours = DateTime.now().difference(videoDate).inHours;

      String timeAgo = '';
      String timeUnit = '';
      int timeValue = 0;

      if (diffInHours < 1) {
        final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
        timeValue = diffInMinutes;
        timeUnit = 'minute'.tr();
      } else if (diffInHours < 24) {
        timeValue = diffInHours;
        timeUnit = 'hour'.tr();
      } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
        timeValue = (diffInHours / 24).floor();
        timeUnit = 'day'.tr();
      } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
        timeValue = (diffInHours / (24 * 7)).floor();
        timeUnit = 'week'.tr();
      } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
        timeValue = (diffInHours / (24 * 30)).floor();
        timeUnit = 'month'.tr();
      } else {
        timeValue = (diffInHours / (24 * 365)).floor();
        timeUnit = 'year'.tr();
      }

      timeAgo = '$timeValue $timeUnit';
      timeAgo += timeValue > 1 ? '' : '';

      return '$timeAgo ${'ago'.tr()}';
    } catch (e) {
      return "";
    }
  }
}
