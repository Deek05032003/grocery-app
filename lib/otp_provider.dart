import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  String _otp = "1234"; // locally stored OTP
  String _enteredOtp = "";

  String get otp => _otp;
  String get enteredOtp => _enteredOtp;

  void setEnteredOtp(String value) {
    _enteredOtp = value;
    notifyListeners();
  }

  bool verifyOtp() {
    return _enteredOtp == _otp;
  }

  void resendOtp() {
    _otp = "1234";
    notifyListeners();
  }
}
