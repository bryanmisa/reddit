import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/screens/login_screen.dart';
import 'package:reddit/theme/pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // async is important for FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // MyApp() has to be wrapped with Widget called
    // ProviderScope to satisfy the requirement of the RiverPod Provider
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: Pallete.darkModeAppTheme,
      // LoginScreen Widget
      home: LoginScreen(),
    );
  }
}
