import 'package:flutter/material.dart';


class ScreenNotFound extends StatefulWidget {
  const ScreenNotFound({Key? key}) : super(key: key);

  @override
  _ScreenNotFoundState createState() => _ScreenNotFoundState();
}

class _ScreenNotFoundState extends State<ScreenNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Page Not Found"),
      ),
    );
  }
}
