import 'config.dart';
import 'dart:html' as html;

class Urls {
  // static final queryUserInfo = "${Config.appBusinessUrl}/user/info";

  // proxy
  static final reverseProxy = "https://thingproxy.freeboard.io/fetch/";

  // callbackURL
  static final callBackUrl = "https://${html.window.location.host}";
  // human code
  static final requestHumanCodeSession =
      "https://humancodeai.com/api/session/v2/get_id";
  static final humanCodeRegistration =
      "https://humancodeai.com/registration/index.html";
}
