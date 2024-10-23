import '../../views/home_page.dart';
import '../../views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return


      StreamBuilder<User?>(
        // Listen to authentication state changes
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If the snapshot has data, the user is logged in
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            //Text('Hello login, ${user!.displayName.toString()}');
            if (user == null) {
              return LoginScreen();
            } else {
              return HomePage(user: user);
            }
          }

          // While waiting for the auth state to load, show a loading spinner
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      );
  }
}
