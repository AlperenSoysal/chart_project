import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  final bool hasTrail;
  final Function? actionFunction;
  CustomAppBar({
    Key? key,
    required this.title,
    this.hasTrail = false,
    this.actionFunction,
  }) : preferredSize =
            const Size.fromHeight(56.0); //change this for appbar height
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      //this is buy/sell stock button
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          onPressed: actionFunction?.call(),
        ),
      ],
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black45, fontWeight: FontWeight.w400),
      ),
    );
  }
}
