import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paint/dependency_injection.dart';

import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(Home());
}


