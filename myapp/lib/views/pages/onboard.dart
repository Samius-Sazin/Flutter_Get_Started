import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/views/pages/login_page.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Lottie.asset(
                  'assets/lotties/lottie_hi.json',
                  height: 200.0,
                ),

                FittedBox(
                  child: Text(
                    "Flutter Mapp is the way to learn Flutter!",
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Submit button
                FilledButton(
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
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
