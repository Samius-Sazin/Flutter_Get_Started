//valueNotifier: Hold the data
//valueListenableBuilder: listen to the data, no need of setState

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);

ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
