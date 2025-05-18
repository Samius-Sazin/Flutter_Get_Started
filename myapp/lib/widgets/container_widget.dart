import 'package:flutter/material.dart';
import 'package:myapp/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(title, style: KTextStyle.titleTealText),

              // description
              Text(
                description,
                style: KTextStyle.descriptionText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
