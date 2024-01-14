import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class NumberFormatterUtil {
  static var numberUtilError = "Error From NumberFormatterUtil => ";

  static String currencyFormatterEn(double? number) {
    String formattedValue = number.toString();
    var formatCurrency = NumberFormat(
      "##,##,##,##0.00",
      "en_US",
    );
    try {
      formattedValue = formatCurrency.format(number);
    } catch (e) {
      Logger().e(numberUtilError + e.toString());
    }
    return formattedValue;
  }

  static String currencyCalculationEn(double number) {
    String formattedValue = number.toString();
    var formatCurrency = NumberFormat(
      "##,##,##,###.##",
      "en_US",
    );
    try {
      formattedValue = formatCurrency.format(number);
    } catch (e) {
      Logger().e(numberUtilError + e.toString());
    }
    return formattedValue;
  }

  /*static double currencyCalculationEn(double number) {
    double formattedValue = number;
    var formatCurrency = new NumberFormat(
      "##,##,##,###.##",
      "en_US",
    );
    try {
      formattedValue = formatCurrency.format(number).toDouble()!;
    } catch (e) {
    }
    return formattedValue;
  }*/

  static String currencyFormatterBn(double? number) {
    String formattedValue = number.toString();
    var formatCurrency = NumberFormat(
      "##,##,##,###.##",
      "ja_JP",
    );
    try {
      formattedValue = formatCurrency.format(number);
    } catch (e) {
      Logger().e(numberUtilError + e.toString());
    }
    return formattedValue;
  }

  static String numberFormatterBn(int number) {
    String formattedValue = number.toString();
    var formatCurrency = NumberFormat(
      "##,##,##,###.##",
      "ja_JP",
    );
    try {
      formattedValue = formatCurrency.format(number);
    } catch (e) {
      Logger().e(numberUtilError + e.toString());
    }
    return formattedValue;
  }

  static String convertNumberIntoBangali(int eng) {
    String bengali = '';
    for (int i = 0; i < eng.toString().length; i++) {
      switch (eng.toString()[i]) {
        case '0':
          bengali = '$bengali০';
          break;
        case '1':
          bengali = '$bengali১';
          break;
        case '2':
          bengali = '$bengali২';
          break;
        case '3':
          bengali = '$bengali৩';
          break;
        case '4':
          bengali = '$bengali৪';
          break;
        case '5':
          bengali = '$bengali৫';
          break;
        case '6':
          bengali = '$bengali৬';
          break;
        case '7':
          bengali = '$bengali৭';
          break;
        case '8':
          bengali = '$bengali৮';
          break;
        case '9':
          bengali = '$bengali৯';
          break;
        default:
          bengali = '${bengali}0';
      }
    }
    return bengali;
  }

  static String convertNumberIntoBangaliDouble(double engInput) {
    String eng = engInput.toStringAsFixed(2);
    String bengali = '';
    for (int i = 0; i < eng.toString().length; i++) {
      switch (eng.toString()[i]) {
        case '0':
          bengali = '$bengali০';
          break;
        case '1':
          bengali = '$bengali১';
          break;
        case '2':
          bengali = '$bengali২';
          break;
        case '3':
          bengali = '$bengali৩';
          break;
        case '4':
          bengali = '$bengali৪';
          break;
        case '5':
          bengali = '$bengali৫';
          break;
        case '6':
          bengali = '$bengali৬';
          break;
        case '7':
          bengali = '$bengali৭';
          break;
        case '8':
          bengali = '$bengali৮';
          break;
        case '9':
          bengali = '$bengali৯';
          break;
        default:
          bengali = bengali + eng.toString()[i];
      }
    }
    return bengali;
  }

  static String convertStringNumberIntoBangali(String eng) {
    String bengali = '';
    for (int i = 0; i < eng.length; i++) {
      switch (eng.toString()[i]) {
        case '0':
          bengali = '$bengali০';
          break;
        case '1':
          bengali = '$bengali১';
          break;
        case '2':
          bengali = '$bengali২';
          break;
        case '3':
          bengali = '$bengali৩';
          break;
        case '4':
          bengali = '$bengali৪';
          break;
        case '5':
          bengali = '$bengali৫';
          break;
        case '6':
          bengali = '$bengali৬';
          break;
        case '7':
          bengali = '$bengali৭';
          break;
        case '8':
          bengali = '$bengali৮';
          break;
        case '9':
          bengali = '$bengali৯';
          break;
        case '.':
          bengali = '$bengali.';
          break;
        default:
          bengali = '${bengali}0';
      }
    }
    return bengali;
  }

  static String convertMonthIntoBangaliMonth(String mName) {
    String bengaliMonth = '';
    String monthName = mName.toLowerCase();
    for (int i = 0; i < monthName.length; i++) {
      switch (monthName) {
        case 'january ':
          bengaliMonth = "জানুয়ারি";
          break;
        case 'february ':
          bengaliMonth = "ফেব্রুয়ারী";
          break;
        case 'march':
          bengaliMonth = "মার্চ";
          break;
        case 'april':
          bengaliMonth = "এপ্রিল";
          break;
        case 'may':
          bengaliMonth = "মে";
          break;
        case 'june':
          bengaliMonth = "জুন";
          break;
        case 'july':
          bengaliMonth = "জুলাই";
          break;
        case 'august':
          bengaliMonth = "আগস্ট";
          break;
        case 'september':
          bengaliMonth = "সেপ্টেম্বর";
          break;
        case 'october':
          bengaliMonth = 'অক্টোবর';
          break;
        case 'november':
          bengaliMonth = 'নভেম্বর';
          break;
        case 'december':
          bengaliMonth = 'ডিসেম্বর';
          break;
        default:
          bengaliMonth = " ";
      }
    }
    return bengaliMonth;
  }

  static StrinconvertTimeIntoBangali(int eng) {
    String bengali = '';
    for (int i = 0; i < eng.toString().length; i++) {
      switch (eng.toString()[i]) {
        case '0':
          bengali = '$bengali০';
          break;
        case '1':
          bengali = '$bengali১';
          break;
        case '2':
          bengali = '$bengali২';
          break;
        case '3':
          bengali = '$bengali৩';
          break;
        case '4':
          bengali = '$bengali৪';
          break;
        case '5':
          bengali = '$bengali৫';
          break;
        case '6':
          bengali = '$bengali৬';
          break;
        case '7':
          bengali = '$bengali৭';
          break;
        case '8':
          bengali = '$bengali৮';
          break;
        case '9':
          bengali = '$bengali৯';
          break;
        default:
          bengali = '$bengali ';
      }
    }
    return bengali;
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
      if (diff.inSeconds > 0 && diff.inSeconds < 60) {
        time = '${diff.inSeconds} seconds ago';
      } else if (diff.inMinutes > 1 && diff.inMinutes < 60) {
        time = '${diff.inMinutes} minutes ago';
      } else if (diff.inHours > 1 && diff.inHours < 24) {
        time = '${diff.inHours} hours ago';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} day ago';
      } else {
        time = '${diff.inDays} days ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} week ago';
      } else {
        time = '${(diff.inDays / 7).floor()} weeks ago';
      }
    }

    return time;
  }

/*static String currencyConverter(double? number) {
    if (number != null) {
      return Constants.currency + currencyFormatterEn(number);
    } else {
      return Constants.currency + "0.00";
    }
  }

  static String currencyConverterInt(int number) {
    if (number != null) {
      return Constants.currency + numberFormatterBn(number);
    } else {
      return Constants.currency + "0";
    }
  }

  static bool numberEditTextValidityCheck(String text) {
    if (text.contains("*") ||
        text.contains("+") ||
        text.contains("-") ||
        text.contains("/") ||
        text.contains(" ")) {
      ToastUtils.instance.showError("Please Give Valid Input");
      return true;
    }
    return false;
  }

  static double? doubleRoundUp(double? amount, int places) {
    try {
      return Decimal.parse(amount.toString()).round(scale: 2).toDouble();
    } catch (e) {
      return amount;
    }
  }*/
}
