import 'package:flutter/material.dart';
import 'package:formvalidation/pallete.dart';
class GradianButton extends StatelessWidget {
  final VoidCallback onpressed;
  
   GradianButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Pallete.gradient1,
            Pallete.gradian2,
            Pallete.gradian3
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          ),
          borderRadius: BorderRadius.circular(7)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 55),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
          ),
          onPressed: onpressed, child: const Text("Sign In",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)),
      ),
    );
  }
}