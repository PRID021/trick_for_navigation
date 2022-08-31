import 'package:flutter/material.dart';
import 'package:research_navigation/home_page.dart';
import 'package:research_navigation/route_animate_builder.dart';
import 'package:research_navigation/routes.dart';

// This is the type used by the popup menu below.
enum Menu { itemOne, itemTwo, itemThree, itemFour }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      // routes: Routes.routes,
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
