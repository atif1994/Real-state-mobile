import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  final String text;
  final IconData? icon;

  const MyButton({
    Key? key,
    this.color = AppColors.themecolor,
    // this.color = Colors.grey,
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
              if (icon != null) ...[
                Icon(icon),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
