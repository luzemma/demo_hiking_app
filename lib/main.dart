import 'package:demo_lakes/pages/home_page.dart';
import 'package:demo_lakes/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme =
        ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
    final ThemeData darkTheme =
        ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      home: MyHomePage(
        title: 'Hiking Travel App',
        isDarkTheme: isDarkTheme,
        onChangeTheme: () {
          setState(() {
            isDarkTheme = !isDarkTheme;
          });
        },
      ),
    );
  }
}
