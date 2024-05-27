
import 'package:flutter/material.dart';
import 'package:mirrorwall/screen/provider/google_provider.dart';
import 'package:mirrorwall/screen/view/google_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => GoogleProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleScreen(),
    );
  }
}
