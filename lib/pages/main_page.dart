import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:villagebanking/pages/home_page.dart';
import 'package:villagebanking/pages/welcome_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return const HomePage();
          } else {
            return const WelcomePage();
          }
        },
      ),
    );
  }
}
