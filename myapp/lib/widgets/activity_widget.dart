import 'package:flutter/material.dart';
import 'package:myapp/data/classes/activity_class.dart';

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final details = {
      'Activity': activity.activity,
      'Type': activity.type,
      'Participants': '${activity.participants}',
      'Price': '${activity.price}',
      'Availability': '${activity.availability}',
      'Accessibility': activity.accessibility,
      'Duration': activity.duration,
      'Kid Friendly': activity.kidFriendly ? 'Yes' : 'No',
      'Link': activity.link,
      'Key': activity.key,
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: details.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: RichText(
              text: TextSpan(
                text: '${entry.key}: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: entry.value,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
