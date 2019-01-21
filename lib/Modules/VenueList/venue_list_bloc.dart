import 'package:rxdart/rxdart.dart';

class VenueMapViewBloc {
  final listController = BehaviorSubject<bool>();
  final mapController = BehaviorSubject<bool>();
  final opacityController = BehaviorSubject<double>();

  Stream<double> get opacityStream => opacityController.stream;
  Stream<bool> get listControlStream => listController.stream;
  Stream<bool> get mapControlStream => mapController.stream;

  Function(double) get opacityChanged => opacityController.sink.add;
  slideComplete(bool status) {
    listController.sink.add(status);
  }

  dispose() {
    listController.close();
    mapController.close();
    opacityController.close();
  }
}

class VenueListBloc {
  final listController = BehaviorSubject<bool>();
  final opacityController = BehaviorSubject<double>();
  Stream<double> get opacityStream => opacityController.stream;
  Stream<bool> get listControlStream => listController.stream;
  Function(double) get opacityChanged => opacityController.sink.add;
  slideComplete(bool status) {
    listController.sink.add(status);
  }

  dispose() {
    listController.close();
    opacityController.close();
  }
}

final venueMapviewBloc = VenueMapViewBloc();
final venueListViewBloc = VenueListBloc();
