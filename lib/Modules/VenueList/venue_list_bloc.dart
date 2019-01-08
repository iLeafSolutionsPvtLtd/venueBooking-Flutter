import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:venue_booking/Modules/MobileNumberValidation/add_mobile_bloc.dart';
import 'package:venue_booking/Modules/VenueList/page_dragger.dart';

class VenueListBloc extends Object
    with VenueListValidators
    implements BaseBloc {
  final venueListController = BehaviorSubject<SlideUpdate>();
  Stream<SlideUpdate> get venueListStream =>
      venueListController.stream.transform(slideUpdateValidator);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

final venueListBloc = VenueListBloc();

mixin VenueListValidators {
  var slideUpdateValidator =
      StreamTransformer<SlideUpdate, SlideUpdate>.fromHandlers(
          handleData: (slideUpdate, sink) {
    if (slideUpdate.updateType == UpdateType.doneDragging) {
      sink.add(SlideUpdate(UpdateType.doneDragging, SlideDirection.none, 0.0,
          slideUpdate.activeIndex, slideUpdate.nextIndex));
      print('handler working');
    } else {
      sink.add(slideUpdate);
    }
  });
}
