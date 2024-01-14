
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateTimeUtils {
  static String formattedDateFromDateTime(
      DateTime dateTime, String desiredDateFormat) {
    DateFormat outputFormat = DateFormat(desiredDateFormat);
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String formatOfferDate(String? date) {
    initializeDateFormatting('en', null);
    if (date == null || date == "null") {
      return "";
    }
    DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZZZZ");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat.yMMMMd('en');
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String formatTimeLineDate(String? date) {
    initializeDateFormatting('en', null);
    if (date == null || date == "null") {
      return "";
    }
    DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZZZZ");
    DateTime dateTime = inputFormat.parseUTC(date).toLocal();
    DateFormat outputFormat = DateFormat(
      'yyyy-MM-dd, hh:mm a',
    );
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getTimeFromDisirededFormat(String date, String format) {
    DateFormat inputFormat = DateFormat("HH:mm:ss");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat(format);
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getDateFromDisirededFormat(String date, String format) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat(format);
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getMonthYearFromDate(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat("d MMM");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String formatPromoDate(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat("MMM d, yyyy");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String formatInDate(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat("MMM d");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getTimeInHrsAndMnts(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = inputFormat.parse(date);
    var d12 = DateFormat('hh:mm a').format(dateTime);
    return d12;
  }

  static String formatComplainCreateDate(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat("d MMM yyyy");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String formatProfileDate(DateTime dateTime, String desiredFormate) {
    DateFormat outputFormat = DateFormat(desiredFormate);
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getOfferRemainingTime(String dateTime) {
    final startOfNextWeek = DateTime.parse(dateTime);
    final remaining = startOfNextWeek.difference(DateTime.now());
    final days = remaining.inDays;
    final hours = remaining.inHours - remaining.inDays * 24;
    final minutes = remaining.inMinutes - remaining.inHours * 60;
    final formattedRemaining = '${days}d ${hours}h ${minutes}m';
    return formattedRemaining;
  }

  static String getDayFromDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat("dd");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getMonthFromDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat("MMM");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static String getWeekDayFromDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat("EEEE");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }

  static bool isTheDateIsToday(String date) {
    DateTime dateTime = DateTime.parse(date);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return dateTime == today ? true : false;
  }

  static String getFormattedDateFromTimestamp(
      int timestamp, String desireFormat) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat(desireFormat).format(date);
    return d12;
  }

  static String getDateFromTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('dd MMMM, yyyy').format(date);
    return d12;
  }

  static String getTimeFromTimestamp12hFormat(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('hh:mm a').format(date);
    return d12;
  }

  static DateTime? getDateFromString(String? date, String desireFormat) {
    if (date == null || date.isEmpty) {
      return null;
    }
    DateFormat inputFormat = DateFormat(desireFormat);
    DateTime dateTime = inputFormat.parse(date);
    return dateTime;
  }
}
