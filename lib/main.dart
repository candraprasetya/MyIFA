import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyIfa - Project Management App',
      initialRoute: "/",
      getPages: router(),
    );
  }
}
