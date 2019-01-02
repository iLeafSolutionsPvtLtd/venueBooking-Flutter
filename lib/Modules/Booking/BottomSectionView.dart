import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSectionView extends StatefulWidget {
  @override
  _BottomSectionViewState createState() => _BottomSectionViewState();
}

class _BottomSectionViewState extends State<BottomSectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text("Apply your voucher",
              style: const TextStyle(
                  color: const Color(0xffe8e8e8),
                  fontWeight: FontWeight.w700,
                  fontFamily: "GoogleSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Icon(Icons.bookmark),
                ],
              ),
              Flexible(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Voucher code'),
              )),
              CupertinoButton(
                child: Text(
                  'Apply',
                  style: TextStyle(
                      color: Color.fromRGBO(57, 181, 74, 1.0), fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 10.0,
        ),
        Container(
          height: 50,
          child: SizedBox.expand(
            child: CupertinoButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(width: 30),
                  Text('CONFIRM BOOKING'),
                  Container(width: 20),
                  Icon(Icons.arrow_forward)
                ],
              ),
              onPressed: () {},
              color: Color.fromRGBO(57, 181, 74, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
          ),
        ),
      ],
    );
  }
}
