import 'package:flutter/material.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/theme/pallete.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          Constants.googlePath,
          width: 40,
        ),
        label: const Text(
          'Continue with Google!',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        // This overrides the style from Elevated button.
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(
              double.infinity,
              50,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            )),
      ),
    );
  }
}
