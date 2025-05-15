import 'package:flutter/material.dart';
import 'package:myapp/data/constants.dart';
import 'package:myapp/views/pages/course_page.dart';
import 'package:myapp/widgets/container_widget.dart';
import 'package:myapp/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> valueList = [
      KValue.basicLayout,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.keyConcepts,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(
              title: "Flutter Mapp",
              nextPage: CoursePage(),
            ),

            // as list.generate creates a list of same items
            // so it need to inside of something that support list,
            // way 1
            // Column(
            //   children: List.generate(5, (index) {
            //     return ContainerWidget(
            //       title: "Basic Layout",
            //       description: "Basic card description",
            //     );
            //   }),
            // ),

            // way 2, better
            ...List.generate(4, (index) {
              return ContainerWidget(
                // title: valueList[index],
                title: valueList.elementAt(index),
                description: "Basic card description",
              );
            }),
          ],
        ),
      ),
    );
  }
}
