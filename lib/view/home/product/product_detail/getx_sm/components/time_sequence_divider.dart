import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grock/grock.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: [10, 5].horizontalAndVerticalP,
      width: 2,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
