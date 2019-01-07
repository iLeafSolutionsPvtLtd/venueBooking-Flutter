import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final PageViewModel viewModel;

  Pages({this.viewModel});

  final pages = [
    PageViewModel(Colors.grey, "assets/phoneMessageIcon.png", "Hotels",
        "This is body", null),
    PageViewModel(
        Colors.blue, "assets/football.png", "Hotels", "This is body", null),
    PageViewModel(
        Colors.red, "assets/phoneIcon.png", "Hotels", "This is body", null)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: viewModel.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: Image.asset(
              viewModel.assetPath,
              width: 50,
              height: 50,
            ),
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              viewModel.title,
              style: TextStyle(color: Colors.white, fontSize: 34),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 75.0),
            child: Text(
              viewModel.body,
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
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
