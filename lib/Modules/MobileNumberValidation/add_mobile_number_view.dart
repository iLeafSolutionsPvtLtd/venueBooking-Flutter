import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/MobileNumberValidation/add_mobile_bloc.dart';
import 'package:venue_booking/Modules/VerifyOTP/verify_otp_view.dart';

class AddMobileView extends StatelessWidget {
  final myController = TextEditingController();

  final Widget title = Container(
    margin: EdgeInsets.all(15.0),
    child: Text("What’s Your Contact Number?",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "GoogleSans",
            fontStyle: FontStyle.normal,
            fontSize: 33.8)),
  );

  final Widget subTitile = Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Text(
          "We need your number to authenticate your identity through OTP verification. We will keep your privacy as ours. Please enter your number below.",
          style: const TextStyle(
              color: const Color(0xffc7c7c7),
              fontWeight: FontWeight.w400,
              fontFamily: "GoogleSans",
              fontStyle: FontStyle.normal,
              fontSize: 16.7)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(),
      home: Scaffold(
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Container(
              height: 64,
            ),
            title,
            subTitile,
            Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Container(
                              height: 15,
                            ),
                            Image(
                              image: AssetImage('assets/phoneIcon.png'),
                              height: 28.0,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                        Flexible(
                            child: Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: StreamBuilder(
                                  stream: addMobileNumberBloc.mobileNumber,
                                  builder: (context, snapshot) => TextField(
                                        onChanged: addMobileNumberBloc
                                            .mobileNumberChanged,
                                        keyboardType: TextInputType.number,
                                        controller: myController,
                                        decoration: InputDecoration(
                                            //border: OutlineInputBorder(),
                                            hintText:
                                                "Enter your mobile number",
                                            errorText: snapshot.error),
                                      ),
                                )))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        StreamBuilder<bool>(
                            stream: addMobileNumberBloc.submitCheck,
                            builder: (context, snapshot) => RawMaterialButton(
                                  onPressed: () => (snapshot.hasData)
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VerifyOTPView(
                                                      myController.text)),
                                        )
                                      : null,
                                  child: new Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 26.0,
                                  ),
                                  shape: new CircleBorder(),
                                  elevation: 2.0,
                                  fillColor: snapshot.hasData
                                      ? Colors.green
                                      : Colors.grey,
                                  padding: const EdgeInsets.all(15.0),
                                ))
                      ],
                    )
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
