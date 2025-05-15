import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // TextEditingController controller = TextEditingController();
  String? textFieldValue = "";
  bool? isChecked_1 = false;
  bool? isChecked_2 = false;
  bool isSwitched_1 = false;
  bool isSwitched_2 = false;
  double sliderValue = 0.0;
  String? dropdownMenuItem = "e1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // if it is a statefull widget then widget.title, otherwise just title
        title: Text(widget.title),
        // automaticallyImplyLeading: true, //auto back button by flutter disabled
        //custorm back button
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // snackbar
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Snackbar"),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text("Open Snackbar"),
              ),

              Divider(color: Colors.teal),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert Title"),
                        content: Text("Alert Dialog"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Open Dialog"),
              ),

              // textfield
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                // controller: controller, // have the text of the field
                onChanged: (String? value) {
                  setState(() {
                    // print("TextField Data: $value");
                    textFieldValue = value;
                  });
                },
              ),
              // Text("TextBox Data: ${controller.text}"),
              Text("TextBox Data: $textFieldValue"),

              SizedBox(height: 10.0),

              //checkbox, switch, slider
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Use adaptive for IOS version styling
                    Checkbox.adaptive(
                      value: isChecked_1,
                      onChanged: (value) {
                        setState(() {
                          isChecked_1 = value;
                        });
                      },
                    ),

                    CheckboxListTile.adaptive(
                      tristate: true,
                      title: Text("Click me..."),
                      value: isChecked_2,
                      onChanged: (value) {
                        setState(() {
                          isChecked_2 = value;
                        });
                      },
                    ),

                    Switch.adaptive(
                      value: isSwitched_1,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched_1 = value;
                        });
                      },
                    ),

                    SwitchListTile.adaptive(
                      title: Text("Switch me..."),
                      value: isSwitched_2,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched_2 = value;
                        });
                      },
                    ),

                    Slider.adaptive(
                      max: 10,
                      divisions: 10,
                      value: sliderValue,
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.0),

              //make the image clickable, way 1
              GestureDetector(
                onTap: () {
                  print("Image Clicked!!");
                },
                child: Image.asset("assets/images/bg.jpg"),
              ),
              SizedBox(height: 10.0),

              // make something clickable, way 2
              // InkWell widget: for click animation
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print("I am clicked!!");
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),

              SizedBox(height: 10.0),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 48, 58, 63),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    // Button, way-1, default,
                    ElevatedButton(onPressed: () {}, child: Text("Click me")),

                    // Button, way-2
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text("Click me"),
                    ),

                    // Button, way 3
                    ElevatedButton(onPressed: () {}, child: Text("Click me")),

                    // Button, way 4
                    FilledButton(onPressed: () {}, child: Text("Click me")),

                    // Button, way 5
                    TextButton(onPressed: () {}, child: Text("Click me")),

                    // Button, way 6
                    OutlinedButton(onPressed: () {}, child: Text("Click me")),

                    // Button, way 7
                    CloseButton(onPressed: () {}),

                    // Button, way 8
                    BackButton(onPressed: () {}),

                    // Dropdown Button
                    DropdownButton(
                      value: dropdownMenuItem,
                      items: [
                        DropdownMenuItem(
                          value: "e1",
                          child: Text("Element-1"),
                          //
                        ),
                        DropdownMenuItem(
                          value: "e2",
                          child: Text("Element-2"),
                          //
                        ),
                        DropdownMenuItem(
                          value: "e3",
                          child: Text("Element-3"),
                          //
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownMenuItem = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
