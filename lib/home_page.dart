import 'package:flutter/material.dart';
import 'package:research_navigation/main.dart';
import 'package:research_navigation/route_animate_builder.dart';

import 'routes.dart';

class MyStatefulWidget extends StatefulWidget {
  final String title;

  const MyStatefulWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();

}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _selectedMenu = '';

  @override
  void dispose() {
    super.dispose();
    print("MyStatefulWidget was dispose from tree");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
              // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.itemOne,
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemFour,
                      child: Text('Item 4'),
                    ),
                  ])
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('_selectedMenu: $_selectedMenu'),
            ElevatedButton(
              onPressed: () {
                showCustomRoute(context);
              },
              child: Text('TextButton'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.pageA);
              },
              child: Text('Goto  page A'),
            )
          ],
        ),
      ),
    );
  }

  Future showCustomRoute(BuildContext context) {
    var page = Center(
      child: OutlinedButton(
        child: const Text('<------------------>'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    var animatedType = PageRoutedAnimatedType.slideBottomToScreenIO;
    var routeBuilder = AnimatedPageRouteBuilder.buildRoute(
      animatedType,
      page,
      opaque: false,
      barrierDismissible: true,
    );

    return Navigator.push(context, routeBuilder);
  }
}
