import 'package:flutter/material.dart';
import 'package:wall/utilities/constants.dart';
import '../utilities/widgets.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: appBar(),
  ),
      backgroundColor: myColors[PRIMARY],
    );
  }
}
