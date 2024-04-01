import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/utils.dart';
import 'extended_inkwell.dart';

class Likes extends StatelessWidget {
  const Likes({
    super.key,
    required this.likes,
    required this.increment,
    required this.decrement,
  });

  final int likes;
  final Function increment;
  final Function decrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.pink.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: Utils.circularBordRad16,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExtendedRInkWell(function: decrement, icon: Icons.remove,),
            const SizedBox(width: 4,),
            SvgPicture.asset(
                'assets/heart.svg',
                colorFilter: getColor()

            ),
            const SizedBox(width: 8,),
            Text(
              '$likes',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4,),
            ExtendedRInkWell(function: increment, icon: Icons.add,),
          ],
        ),
      ),
    );
  }

  ColorFilter getColor() {
    var color = Colors.black;
    if (likes < 0) {
      color = Colors.grey;
    } else if (likes == 0) {
      color = Colors.black;
    } else {
      color = Colors.red;
    }
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
