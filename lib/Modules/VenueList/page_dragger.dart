import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/VenueList/venue_list_bloc.dart';

class PageDragger extends StatefulWidget {
  final canDragLeftToRight;
  final canDragRightToLeft;
  final length;
  PageDragger({this.canDragLeftToRight, this.canDragRightToLeft, this.length});
  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const FULL_TRANSITION_PX = 300.0;
  Offset dragStart;
  SlideDirection slideDirection;
  double slidePercent = 0.0;
  int activeIndex = 0;
  int nextIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }

  void onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newposition = details.globalPosition;
      final dx = dragStart.dx - newposition.dx;
      if (dx > 0.0 && widget.canDragRightToLeft) {
        print('right to left');
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx < 0.0 && widget.canDragLeftToRight) {
        print('left to right');

        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }
      nextIndex.clamp(0, widget.length);
      if (slideDirection == SlideDirection.leftToRight) {
        nextIndex = activeIndex - 1;
      } else if (slideDirection == SlideDirection.rightToLeft) {
        nextIndex = activeIndex + 1;
      } else {
        nextIndex = activeIndex;
      }

      if (slideDirection != SlideDirection.none) {
        slidePercent = (dx / FULL_TRANSITION_PX).abs().clamp(0.0, 1.0);
      } else {
        slidePercent = 0.0;
      }
      //print('dragging $slideDirection at $slidePecent');
      venueListBloc.venueListController.add(SlideUpdate(UpdateType.dragging,
          slideDirection, slidePercent, activeIndex, nextIndex));
    }
  }

  void onDragEnd(DragEndDetails details) {
    activeIndex = slideDirection == SlideDirection.leftToRight
        ? activeIndex - 1
        : activeIndex + 1;
    activeIndex.clamp(0.0, widget.length);
    venueListBloc.venueListController.add(SlideUpdate(UpdateType.doneDragging,
        SlideDirection.none, 0.0, activeIndex, nextIndex));
    dragStart = null;
  }
}

enum UpdateType { dragging, doneDragging }

enum SlideDirection { leftToRight, rightToLeft, none }

class SlideUpdate {
  final updateType;
  final direction;
  final slidePercent;
  final activeIndex;
  final nextIndex;
  SlideUpdate(this.updateType, this.direction, this.slidePercent,
      this.activeIndex, this.nextIndex);
}
