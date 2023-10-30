import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/features/auth/controller/auth_controller.dart';
import 'package:reddit/theme/pallete.dart';

// ConsumerWidget was used instead of Stateless widget to manage and add the
// signInWithGoogle Function with provider from the auth_controller.dart

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  // this function is referenced from the signInWithGoogle() from
  // the auth_controller.dart and is then passed to onPressed.
  void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // the WidgetRef ref is builtin with ConsumerWidget
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref),
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
