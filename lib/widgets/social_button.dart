import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formvalidation/pallete.dart';
class SocialButton extends StatelessWidget {
  final String iconPath;
  final String lable;
  final double horizontalPadding;
  
  const SocialButton({super.key, required this.iconPath, required this.lable, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: (){},
    icon: SvgPicture.asset(
      iconPath,
      width: 25,
      color: Pallete.whiteColor,
    ),
    label: Text(
      lable,style: const TextStyle(
        color: Pallete.whiteColor,fontSize: 17
      ),
    ),
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: horizontalPadding),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Pallete.borderColor,
          width: 3
        ),
        borderRadius: BorderRadius.circular(10)
      )
    ),
    );
  }
}