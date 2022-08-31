import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  final String title;
  final Function()? onPress;
  final String infoNextPage;

  const MyPage(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.infoNextPage})
      : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){

              setState(() {
                widget.onPress!();
              });
            },
            child: Text(widget.infoNextPage),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("Page${widget.title} was dispose from tree");
  }
}
