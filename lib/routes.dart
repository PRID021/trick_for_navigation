import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:research_navigation/home_page.dart';

import 'my_page.dart';

abstract class BuilderContextManager {
  static final Map<Map<String, Completer>, MaterialPageRoute> mapRoutes = {};
}

class Routes {
  static String home = "/";
  static String pageA = "a";
  static String pageB = "b";
  static String pageC = "c";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (kDebugMode) print("On generateRoute");
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case "/":
        Completer completer = Completer();
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) {
            completer.complete(context);
            return const MyStatefulWidget(
              title: 'MyStatefulWidget',
            );
          },
        );
        BuilderContextManager.mapRoutes[{"/": completer}] = route;
        return route;
      case "a":
        Completer completer = Completer();
        MaterialPageRoute route = MaterialPageRoute(builder: (context) {
          completer.complete(context);
          return MyPage(
            title: 'MyPageA',
            infoNextPage: 'Navigator.pushNamed(context, "b");',
            onPress: () {
              Navigator.pushNamed(context, "b");
            },
          );
        });
        BuilderContextManager.mapRoutes[{"a": completer}] = route;
        return route;

      case "b":
        Completer completer = Completer();
        MaterialPageRoute route = MaterialPageRoute(builder: (context) {
          completer.complete(context);
          return MyPage(
            title: 'MyPageB',
            infoNextPage: 'Navigator.pushNamed(context, "C");',
            onPress: () {
              Navigator.pushNamed(context, "c");
            },
          );
        });
        BuilderContextManager.mapRoutes[{"b": completer}] = route;
        return route;

      case "c":
        Completer completer = Completer();
        MaterialPageRoute route = MaterialPageRoute(builder: (context) {
          completer.complete(context);
          return MyPage(
            title: 'MyPageC',
            infoNextPage: 'Do something weird!',
            onPress: () {
              var firstItem = BuilderContextManager.mapRoutes.values.first;
              var firstKey = BuilderContextManager.mapRoutes.keys.first;
              Navigator.removeRoute(context, firstItem);
              BuilderContextManager.mapRoutes.remove(firstKey);
            },
          );
        });
        BuilderContextManager.mapRoutes[{"c": completer}] = route;
        return route;
    }
    throw Exception("Can't find any route have match config");
  }
}
