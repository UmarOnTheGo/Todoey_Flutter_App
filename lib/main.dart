import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter_app/model/task_data.dart';
import 'package:todoey_flutter_app/screens/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
          theme: ThemeData.light().copyWith(
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Colors.lightBlue,
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.lightBlueAccent),
          ),
          home: LoginPage()),
    );
  }
}
