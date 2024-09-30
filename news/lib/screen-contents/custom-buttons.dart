
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.text,
    this.iconname,
    required this.buttonColor,
    required this.textCOlor,
    this.iconColor,
  });

  final String text;
  final IconData? iconname;
  final Color buttonColor;
  final Color textCOlor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconname,
              color: iconColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "MontM",
                fontSize: 13,
                color: textCOlor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
