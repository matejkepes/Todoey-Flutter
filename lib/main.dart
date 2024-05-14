import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/task_data.dart';
import '/screens/task_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const TaskScreen(),
      ),
    );
  }
}
