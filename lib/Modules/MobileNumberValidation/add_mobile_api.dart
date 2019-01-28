import 'dart:convert';

import 'package:http/http.dart';
import 'package:venue_booking/Models/user.dart';
import 'package:venue_booking/constants.dart';

class AddMobileApi {
  final String mobileNumber;
  AddMobileApi(this.mobileNumber);

  final Client _client = Client();
  String _verifyOtpUrl =
      Uri.encodeFull(Constants.baseUrl + 'user/get_otp/?phone={phone}');
  String _generateOtpUrl =
      Uri.encodeFull(Constants.baseUrl + 'user/get_otp/?phone={phone}');
  VerifyOTPResponse a;

  Future<VerifyOTPResponse> verifyOtp() async {
    return await _client
        .get(Uri.parse(_verifyOtpUrl.replaceAll('{phone}', mobileNumber)),
            headers: {"Content-Type": "application/json"})
        .then((Response res) => res.body)
        .then(json.decode)
        .then((json) => VerifyOTPResponse.fromJson(json));
  }

  Future<int> generateOtp() async {
    print(_generateOtpUrl);
    return await _client
        .get(Uri.parse(_generateOtpUrl.replaceAll('{phone}', mobileNumber)))
        .then((Response res) => res.statusCode);
  }
}
