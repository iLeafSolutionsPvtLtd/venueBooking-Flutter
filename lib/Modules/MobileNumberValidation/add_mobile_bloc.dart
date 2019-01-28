import 'package:rxdart/rxdart.dart';
import 'package:venue_booking/Modules/validators/validators.dart';

class AddMobileBloc extends Object
    with Validators
    implements BaseBloc, LoadingControllerBloc {
  final _mobileNumberController = BehaviorSubject<String>();
  Function(String) get mobileNumberChanged => _mobileNumberController.sink.add;
  Observable<String> get mobileNumber =>
      _mobileNumberController.stream.transform(mobileNumberValidator);
  Observable<bool> get submitCheck =>
      Observable.combineLatest2(mobileNumber, mobileNumber, (m, n) => true);

  @override
  void dispose() {
    _mobileNumberController.close();
    // TODO: implement dispose
  }

  @override
  // TODO: implement _loadingController
  BehaviorSubject<bool> get _loadingController => null;

  @override
  // TODO: implement isLoadingStream
  Observable<bool> get isLoadingStream => null;
}

abstract class BaseBloc {
  void dispose();
}

class LoadingControllerBloc implements BaseBloc {
  final _loadingController = BehaviorSubject<bool>();
  Observable<bool> get isLoadingStream => _loadingController.stream;
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
