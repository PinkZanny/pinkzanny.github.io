import 'package:fluttertoast/fluttertoast.dart';
import 'package:website/utils/color_ext.dart';
import 'package:website/utils/constants.dart';

class CustomToast {
  static void successToast(String message) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 2,
        msg: message,
        backgroundColor: Constants.successColor,
        fontAsset: '/assets/fonts/HelveticaNeue.ttf',
        webBgColor:
            "linear-gradient(to right, ${Constants.successColor.toHex(leadingFF: false)}, ${Constants.successColor.toHex(leadingFF: false)})",
        webPosition: "center");
  }

  static void errorToast(String message) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        fontAsset: '/assets/fonts/HelveticaNeue.ttf',
        timeInSecForIosWeb: 2,
        msg: message,
        backgroundColor: Constants.failureColor,
        webBgColor:
            "linear-gradient(to right, ${Constants.failureColor.toHex(leadingFF: false)}, ${Constants.failureColor.toHex(leadingFF: false)})",
        webPosition: "center");
  }
}
