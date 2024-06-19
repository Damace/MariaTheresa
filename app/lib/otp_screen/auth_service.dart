import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static String verifyId = "";

  static Future sentOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
            timeout: Duration(seconds: 30),
            phoneNumber: "+255$phone",

            verificationCompleted: ((phoneAuthCredential) async {
              return;
            }),
            verificationFailed: (error) async {
              return;
            },
            codeSent: ((verificationId, forceResendingToken) async {
              verifyId = verificationId;
              nextStep();
            }),
            codeAutoRetrievalTimeout: ((verificationId) async {
              return;
            }))
        .onError((error, stackTrace) {
      errorStep();
    });
  }



// Now Verify the OTP
  static Future loginWithOtp({required String otp,phone}) async {
  final cred = PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {

           
          // print("+255$phone");


        return "Success";
      } else {
        return "Error in OTP Login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }
//to log out user

  static Future logout() async {
    await _firebaseAuth.signOut();
  }

//weither user has login or not

  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
