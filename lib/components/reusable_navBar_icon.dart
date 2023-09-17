import 'package:flutter/material.dart';

class ReusableNavBarIcon extends StatefulWidget {
  final String toolTip;
  final String toolTitle;
  final IconData iconData;
  const ReusableNavBarIcon(
      {super.key,
      required this.toolTip,
      required this.toolTitle,
      required this.iconData});

  @override
  State<ReusableNavBarIcon> createState() => _ReusableNavBarIconState();
}

class _ReusableNavBarIconState extends State<ReusableNavBarIcon> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          tooltip: widget.toolTip,
          icon:  Icon(
            widget.iconData,
            color: Colors.white24,
          ),
          onPressed: () {

          },
        ),
        Text(
          widget.toolTitle,
          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white24 ),

        )
      ],
    );
  }
}
