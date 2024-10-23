import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    "email",
    // 'https://www.googleapis.com/auth/contacts.readonly'
  ],
     // clientId: "299473638814-eb7qtohmvu2lop732nc5lo9qpseev6pg.apps.googleusercontent.com"
  );

// Future<User?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn(
//
//     );
//     if (googleUser == null) {
//       // User canceled the sign-in
//       return null;
//     }
//
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     print('my account : ${googleAuth.accessToken}');
//     UserCredential userCredential = await _auth.signInWithCredential(credential);
//     print('my account : ${userCredential.}');
//     return userCredential.user;
//   } catch (e) {
//     print("Error signing in with Google: $e");
//     return null;
//   }
// }
  GoogleSignIn googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
    await signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print('my account : ${googleUser.email}');
    // Once signed in, return the UserCredential
    //await userController.socialMediaLogInUser(googleUser.email,googleUser.displayName.toString(),idtoken,context);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  //Sign out
  signOut() async {
    if(FirebaseAuth.instance.currentUser == null ){
      print('no google account');
    }else{
      print('logging out');
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
  }
}
