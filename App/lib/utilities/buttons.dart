import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomWidget extends StatelessWidget {
  String label;
  Function onPressed()?;
  CustomWidget({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (() => onPressed),
      color: Colors.white,
      child: FloatingActionButton.,

    );
  }
}
