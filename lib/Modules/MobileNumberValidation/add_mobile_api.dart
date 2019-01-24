import 'dart:convert';

import 'package:http/http.dart';
import 'package:venue_booking/Models/user.dart';

class AddMobileApi {
  final String mobileNumber;
  AddMobileApi(this.mobileNumber);

  final Client _client = Client();
  static const String _url = 'user/get_otp/?phone={phone}';
  VerifyOTPResponse a;

  Future<VerifyOTPResponse> verifyOtp() async {
    return await _client
        .get(Uri.parse(_url.replaceAll('{phone}', mobileNumber)))
        .then((Response res) => res.body)
        .then(json.decode)
        .then((json) => VerifyOTPResponse.fromJson(json));
  }
}
