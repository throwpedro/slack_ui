import 'package:flutter/material.dart';

class EmojiButton extends StatelessWidget {
  final IconData icon;
  final String count;

  const EmojiButton({this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(2),
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15,
              color: Colors.yellow.shade600,
            ),
            Text(
              ' $count',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
