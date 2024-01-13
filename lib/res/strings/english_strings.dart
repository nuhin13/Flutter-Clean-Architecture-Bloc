import 'strings.dart';

class EnglishStrings extends Strings {
  @override
  String get appName => "Dizi Cashier";

  @override
  String get loginDescription =>
      'We will send --------- code to login';

  @override
  String get loginText => "Login to continue";

  @override
  String get registrationText => "Register with Email";

  @override
  String get registrationGoogleText => "Register with Google";

  @override
  String get registrationAppleText => "Register with Apple";

  @override
  String get proceedToRegister => "Proceed to member registration";

  @override
  String get proceedToLogin => "Click here if you have an account";

  @override
  String get next => "Next";

  @override
  String get login => "Login";

  @override
  String get forgotPassword => "Forgot Password";

  @override
  String get verification => "Verification";

  @override
  String get enterVerification => "Enter Verification Code";

  @override
  String get verify => "Verify";

  @override
  String get send => "Send";

  @override
  String get submit => "Submit";

  @override
  String get ok => "OK";

  @override
  String get cancel => "Cancel";

  @override
  String get resend => "Resend";

  @override
  String get joinFree => "Join Free";

  @override
  String get email => "Email Address";

  @override
  String get emailHint => "example@gmail.com";

  @override
  String get enterEmail => "Enter Email Address";

  @override
  String get enterEmailInstructions =>
      "Enter the email associated with your account to receive reset instructions";

  @override
  String get password => "Password";

  @override
  String get passwordHint => "Enter Password";

  @override
  String get obscurePassword => "********";

  @override
  String get newPassword => "New Password";

  @override
  String get enterNewPassword => "Enter New Password";

  @override
  String get confirmPassword => "Confirm Password";

  @override
  String get storeInformation => "Store Information";

  @override
  String get companyInformation => "Company Name (Optional)";

  @override
  String get companyName => "Company Name";

  @override
  String get storeName => "Store Name";

  @override
  String get storeNameError => "Not Entered";

  @override
  String get storeAddress => "Store Address";

  @override
  String get enterAddress => "Enter Address";

  @override
  String get searchStore => "Search for the Store";

  @override
  String get mapLocation => "Map Location";

  @override
  String get setOnMap => "Set on map";

  @override
  String get setLocation => "Set location";

  @override
  String get zipCode => "Zip Code";

  @override
  String get zipCodeError => 'Please enter in the format "000-0000"';

  @override
  String get zipHint => "000-0000";

  @override
  String get prefecture => "Prefecture";

  @override
  String get streetNumber => "Street Number";

  @override
  String get buildingName => "Building Name";

  @override
  String get nearestStation => "Nearest Station";

  @override
  String get storePhone => "Store Phone Number";

  @override
  String get storePhoneError => 'Please enter in the format "000-0000-0000"';

  @override
  String get storePhoneHint => "070-0000-0000";

  @override
  String get createAccount => "Create Account";

  @override
  String get otpText => "If you didn’t receive a code!";

  @override
  String get passwordResetSuccessTitle => "Password Changed Successfully";

  @override
  String get passwordResetSuccessSubtitle =>
      "Always keep your password safe and never share it with anybody";

  @override
  String get doNotMatch => "Your both password doesn't match";

  @override
  String get emailExistError => "This email address already exists";

  @override
  String get tryAfterSometimeToast => "Please wait sometime... and try again";

  @override
  String get otpEmptyToast => "Please input otp";

  @override
  String get invalidNumberToast => "Please input a valid number";

  @override
  String get mobilePattern => r'\+?(88)?0?1[3456789][0-9]{8}\b';

  @override
  String get numberOnly => r'^[0-9]+$';

  @override
  String get otpBarTitle => "Check your phone number";

  @override
  String get otpTitle => "Enter the 6 digit code sent to";

  @override
  String get otpSend => "Send";

  @override
  String get otpResend => "Resend";

}
