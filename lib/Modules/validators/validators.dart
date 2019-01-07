import 'dart:async';

mixin Validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Email is not valid");
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password length should be greater than 4 chars.");
    }
  });
  var mobileNumberValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (mobile.length >= 10) {
      sink.add(mobile);
    } else {
      sink.addError("Enter a valid mobile number.");
    }
  });

  var otpValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (mobile.length >= 4) {
      sink.add(mobile);
    } else {
      sink.addError("Enter a valid 4 digit OTP.");
    }
  });
}
