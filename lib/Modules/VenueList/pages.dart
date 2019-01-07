import 'package:flutter/material.dart';
final pages = [
  PageViewModel(Colors.grey, "assets/phoneMessageIcon.png", "Hotels",
      "This is body0", null),
  PageViewModel(
      Colors.blue, "assets/football.png", "restaurants", "This is body1", null),
  PageViewModel(
      Colors.red, "assets/phoneIcon.png", "Teashops", "This is body2", null)
];

class Pages extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;
  Pages({this.viewModel, this.percentVisible = 1.0});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: viewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(0.0, (50.0)* (1.0 - percentVisible) , 0.0),
              child: Padding(
                child: Image.asset(
                  viewModel.assetPath,
                  width: 50,
                  height: 50,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0*(1.0-percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  viewModel.title,
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0*(1.0-percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 75.0),
                child: Text(
                  viewModel.body,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String assetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(
      this.color, this.assetPath, this.title, this.body, this.iconAssetIcon);
}
