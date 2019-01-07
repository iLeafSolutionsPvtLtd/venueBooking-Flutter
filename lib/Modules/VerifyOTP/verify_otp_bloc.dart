import 'package:rxdart/rxdart.dart';
import 'package:venue_booking/Modules/MobileNumberValidation/add_mobile_bloc.dart';
import 'package:venue_booking/Modules/validators/validators.dart';

class VerifyOTPBloc extends Object with Validators implements BaseBloc {
  final _otpController = BehaviorSubject<String>();
  Function(String) get otpChanged => _otpController.sink.add;
  Stream<String> get otp => _otpController.stream.transform(otpValidator);
  Stream<bool> get otpCheck =>
      Observable.combineLatest2(otp, otp, (a, b) => true);

  @override
  void dispose() {
    _otpController.close();
    // TODO: implement dispose
  }
}

final verifyOTPBloc = VerifyOTPBloc();
