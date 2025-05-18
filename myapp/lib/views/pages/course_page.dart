import 'package:flutter/material.dart';
import 'package:myapp/data/classes/activity_class.dart';
import 'package:myapp/widgets/activity_widget.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    // pub dev code
    var url = Uri.https('bored-api.appbrewery.com', '/random');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          Widget widget;

          if (snapshot.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Activity activity = snapshot.data;

            widget = ActivityWidget(activity: activity);
          } else {
            widget = Center(child: Text("Error Fetching Data"));
          }

          return widget;
        },
      ),
    );
  }
}
