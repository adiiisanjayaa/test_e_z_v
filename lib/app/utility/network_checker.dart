import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkCheck {
  Future<bool> check() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return checkInternetConnection(connectivityResult);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return checkInternetConnection(connectivityResult);
      } else {
        // This needed cause there is case in IOS either the mobile/wifi is ON, the connectivity result still have value ConnectivityResult.none
        return checkInternetConnection(connectivityResult);
      }
    } catch (e) {
      log("Network Check: error Connectivity");
      return false;
    }
  }

  Future<bool> checkInternetConnection(ConnectivityResult networkState) async {
    try {
      bool haveInternet = await InternetConnectionCheckerPlus().hasConnection;
      log("Network Check: $networkState -- ${haveInternet ? 'Have Inet' : 'Not Have Inet'}");
      return haveInternet;
    } catch (e) {
      log("Network Check: error CheckInternetConnection");
      return false;
    }
  }

  dynamic checkInternet(Function func) {
    check().then((intenet) {
      if (intenet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
