import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/views/widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //auto filled the text area
  TextEditingController controllerEmail = TextEditingController(text: "111");
  TextEditingController controllerPw = TextEditingController(text: "222");

  // todo: demo
  String confirmedEmail = '111';
  String confirmedPw = '222';

  // only used in state FULL widget
  // only run once when this page is called
  // @override
  // void initState() {
  //   // print("Initialize State");
  //   super.initState();
  // }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPw.dispose();
    super.dispose();
  }

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
                Lottie.asset('assets/lotties/lottie_home.json', height: 200.0),

                SizedBox(height: 20.0),

                //Email textfield
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email', //placeholder
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  ),
                  controller: controllerEmail,
                  onEditingComplete: () {
                    //hide the keyboard
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                ),

                SizedBox(height: 5.0),

                // Password Textfield
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  ),
                  controller: controllerPw,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                ),

                // Submit button
                FilledButton(
                  onPressed: () {
                    onLoginPressed();
                  },
                  style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0)),
                  child: Text(widget.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //check validation, and navigate to desired page
  void onLoginPressed() {
    if (controllerEmail.text == confirmedEmail && controllerPw.text == confirmedPw) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}
