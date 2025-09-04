import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninApi {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<GoogleSignInAccount?> login() => _googleSignIn.authenticate();
}