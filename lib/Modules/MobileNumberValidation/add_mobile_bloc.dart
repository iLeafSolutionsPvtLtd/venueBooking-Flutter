import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:venue_booking/Modules/validators/validators.dart';

class AddMobileBloc extends Object with Validators implements BaseBloc {
  final _mobileNumberController = BehaviorSubject<String>();
  Function(String) get mobileNumberChanged => _mobileNumberController.sink.add;
  Stream<String> get mobileNumber =>
      _mobileNumberController.stream.transform(mobileNumberValidator);
  Stream<bool> get submitCheck =>
      Observable.combineLatest2(mobileNumber, mobileNumber, (m, n) => true);

  @override
  void dispose() {
    _mobileNumberController.close();
    // TODO: implement dispose
  }
}

abstract class BaseBloc {
  void dispose();
}
