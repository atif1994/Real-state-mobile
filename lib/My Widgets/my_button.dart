import 'package:flutter/material.dart';

import '../Services/constants.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  final String text;
  final IconData? icon;

  const MyButton({
    Key? key,
    this.color = primaryColor,
    required this.onTap,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      textColor: Colors.white,
      color: color,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
              if(icon != null)...[
                Icon(icon),
              ],
            ],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
