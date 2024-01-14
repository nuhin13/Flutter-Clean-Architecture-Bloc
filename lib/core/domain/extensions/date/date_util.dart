
import '../extension_export.dart';

extension _TwoDigit on int {
  String twoDigit() {
    return toString().padLeft(2, '0');
  }
}

extension DateUtil on DateTime {
  String toMysqlDateTimeString() {
    return "${toMysqlDateString()} ${toMysqlTimeString()}";
  }

  String toTimeStringWithoutSeconds() {
    return "${hour.twoDigit()}:${minute.twoDigit()}";
  }

  String toMysqlTimeString() {
    return "${toTimeStringWithoutSeconds()}:${second.twoDigit()}";
  }

  String toMysqlDateString() {
    return "${year.toString()}-${month.twoDigit()}-${day.twoDigit()}";
  }

  String get weekdayName {
    return ["mon", "tue", "wed", "thu", "fri", "sat", "sun"][weekday - 1];
  }

  String toMyWHMString() {
    return "${month.twoDigit()}/${(year % 100).toString()} ($weekdayName), ${toTimeStringWithoutSeconds()}";
  }

  String getDayOfMonthSuffix() {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String getOrdinalDay() {
    return day.toString() + getDayOfMonthSuffix();
  }

  String getMonthLongName() {
    return [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ][month - 1];
  }

  String toOrdinalDateString() {
    return "${getOrdinalDay()} ${getMonthLongName()} $year";
  }

  String toDMYString({String separator = "/"}) {
    return "${day.twoDigit()}$separator${month.twoDigit()}$separator${year.toString()}";
  }

  static DateTime parseFromDMY(String date, {String separator = "/"}) {
    try {
      var dateSplitted = date.split(separator);
      var mysqlString =
          "${dateSplitted[2]}-${dateSplitted[1]}-${dateSplitted[0]}";
      return DateTime.parse(mysqlString);
    } catch (_) {
      throw FormatException("Invalid DMY format: $date");
    }
  }

  bool isNow() {
    return isAtSameMomentAs(DateTime.now());
  }
}

extension DurationUtil on Duration {
  String toMMSS() {
    return "${inMinutes.twoDigit()}:${inSeconds.remainder(60).twoDigit()}";
  }

  String toMSS() {
    return "${NumberFormatterUtil.numberFormatterBn(inMinutes)}:${NumberFormatterUtil.numberFormatterBn(int.parse(inSeconds.remainder(60).twoDigit()))}";
  }
}
