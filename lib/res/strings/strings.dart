
abstract class Strings {
  // Common
  String get appName;
  String get send;
  String get submit;
  String get ok;
  String get cancel;
  String get resend;

  // Authentication
  String get loginDescription;
  String get loginText;
  String get registrationText;
  String get registrationGoogleText;
  String get registrationAppleText;
  String get proceedToRegister;
  String get proceedToLogin;
  String get next;
  String get login;
  String get forgotPassword;
  String get verification;
  String get enterVerification;
  String get verify;
  String get joinFree;
  String get email;
  String get emailHint;
  String get enterEmail;
  String get enterEmailInstructions;
  String get password;
  String get passwordHint;
  String get obscurePassword;
  String get newPassword;
  String get enterNewPassword;
  String get confirmPassword;
  String get storeInformation;
  String get companyInformation;
  String get companyName;
  String get storeName;
  String get storeNameError;
  String get storeAddress;
  String get enterAddress;
  String get searchStore;
  String get mapLocation;
  String get setOnMap;
  String get setLocation;
  String get zipCode;
  String get zipCodeError;
  String get zipHint;
  String get prefecture;
  String get streetNumber;
  String get buildingName;
  String get nearestStation;
  String get storePhone;
  String get storePhoneError;
  String get storePhoneHint;
  String get createAccount;
  String get otpText;
  String get passwordResetSuccessTitle;
  String get passwordResetSuccessSubtitle;
  String get doNotMatch;
  String get emailExistError;
  String get tryAfterSometimeToast;
  String get otpEmptyToast;
  String get invalidNumberToast;
  String get mobilePattern;
  String get numberOnly;

  String get otpBarTitle;
  String get otpTitle;
  String get otpResend;
  String get otpSend;

  static String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.substring(2, 7);
  }
}

String get mobilePattern => r'\+?(88)?0?1[3456789][0-9]{8}\b';

String get numberOnly => r'^[0-9]+$';
