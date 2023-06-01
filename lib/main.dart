import 'package:easacc_task/config/app_theme.dart';
import 'package:easacc_task/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easacc Task',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}