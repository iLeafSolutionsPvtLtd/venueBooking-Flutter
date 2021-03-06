import 'package:flutter/material.dart';
import 'package:venue_booking/Modules/Blocks/blocProvider.dart';
import 'package:venue_booking/Modules/Booking/booking_view.dart';
import 'package:venue_booking/Modules/VerifyOTP/verify_otp_bloc.dart';

class VerifyOTPView extends StatelessWidget {
  final String mobileNumber;
  VerifyOTPView(this.mobileNumber);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyOTPBloc>(
      builder: (_, bloc) {
        return bloc ?? VerifyOTPBloc();
      },
      onDispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
        theme: ThemeData.fallback(),
        home: Scaffold(
          body: SafeArea(
              child: ListView(
            children: <Widget>[
              emptySpaceWith(64, 0),
              title(),
              subtitle(),
              OtpBaseView()
            ],
          )),
        ),
      ),
    );
  }

  Widget title() => Container(
        margin: EdgeInsets.all(15.0),
        child: Text("Did you get the OTP for verification?",
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "GoogleSans",
                fontStyle: FontStyle.normal,
                fontSize: 33.8)),
      );

  Widget subtitle() => Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Text(
          "A OTP (One Time Passcode) has been sent to +91$mobileNumber. Please enter the OTP in the field below to verify.",
          style: const TextStyle(
              color: const Color(0xffc7c7c7),
              fontWeight: FontWeight.w400,
              fontFamily: "GoogleSans",
              fontStyle: FontStyle.normal,
              fontSize: 16.7)));

  Widget emptySpaceWith(double height, double width) => Container(
        height: height,
        width: width,
      );
}

class OtpBaseView extends StatefulWidget {
  @override
  _OtpBaseViewState createState() => _OtpBaseViewState();
}

class _OtpBaseViewState extends State<OtpBaseView> {
  final myController = TextEditingController();

  Widget otpInputView() => Container(
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
                    image: AssetImage('assets/phoneMessageIcon.png'),
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
                        stream: verifyOTPBloc.otp,
                        builder: (context, snapshot) => TextField(
                              onChanged: verifyOTPBloc.otpChanged,
                              keyboardType: TextInputType.number,
                              controller: myController,
                              decoration: InputDecoration(
                                  //border: OutlineInputBorder(),
                                  hintText: "Enter OTP",
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
                  stream: verifyOTPBloc.otpCheck,
                  builder: (context, snapshot) => RawMaterialButton(
                        onPressed: () => (snapshot.hasData)
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingView()),
                              )
                            : null,
                        child: new Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 26.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor:
                            snapshot.hasData ? Colors.green : Colors.grey,
                        padding: const EdgeInsets.all(15.0),
                      ))
            ],
          )
        ],
      ));
  @override
  Widget build(BuildContext context) {
    return otpInputView();
  }
}
