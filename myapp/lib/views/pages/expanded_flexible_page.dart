import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Expanded example
          Expanded(
            child: Column(
              children: [
                // Takes as much space as possible
                Expanded(
                  child: Container(color: Colors.teal),
                ),
                // flex: 2 means take double space
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.orange),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),

          // Flexible example
          Row(
            children: [
              // take whole space, that is assigned to it
              Expanded(
                child: Container(
                  height: 40.0,
                  color: Colors.amber,
                  child: Text("This is Sami"),
                ),
              ),

              // take as much as space needed
              Flexible(
                child: Container(
                  height: 40.0,
                  color: Colors.blueAccent,
                  child: Text("This is Sami"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
