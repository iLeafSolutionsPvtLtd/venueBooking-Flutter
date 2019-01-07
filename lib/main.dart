import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/VenueList/venue_list_view.dart';

void main() => runApp(VenueBookingMain());

class VenueBookingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VenueListView();
  }
}
