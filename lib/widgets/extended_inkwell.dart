import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ExtendedRInkWell extends StatelessWidget {
  const ExtendedRInkWell({super.key, required this.function, required this.icon});

  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Utils.circularBordRad16,
      onTap: () {
        function.call();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: Utils.circularBordRad16,
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon),
      ),
    );
  }
}