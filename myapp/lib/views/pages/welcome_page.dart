import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/views/pages/login_page.dart';
import 'package:myapp/views/pages/onboard.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Lottie.asset('assets/lotties/lottie_welcome.json', height: 300.0),

                SizedBox(height: 20.0),

                FittedBox(
                  child: Text(
                    "Flutter Mapp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      letterSpacing: 40.0,
                    ),
                  ),
                ),

                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardPage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0)),
                  child: Text("Get Started"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Login");
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(minimumSize: Size(double.infinity, 40.0)),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
