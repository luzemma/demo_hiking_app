import 'package:demo_lakes/theme/theme.dart';
import 'package:demo_lakes/widgets/place.dart';
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

class MyHomePage extends StatefulWidget {
  final String title;
  final bool isDarkTheme;
  final VoidCallback onChangeTheme;

  const MyHomePage({
    super.key,
    required this.title,
    required this.isDarkTheme,
    required this.onChangeTheme,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int score = 41;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: widget.onChangeTheme,
                icon: Icon(
                    widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Place(
              title: "Emerald Lake",
              subtitle: "Yoho National Park, British Columbia",
              imageUrl:
                  "https://i.etsystatic.com/17438404/r/il/69098c/2039795046/il_fullxfull.2039795046_o1e7.jpg",
              description:
                  "Emerald Lake is one of the most admired destinations in Yoho National Park, with an unmatched diversity of both activities and landscapes suited to the enthusiastic traveler. The hike around the lake, clocking in at about an hour, is one of the least strenuous but most rewarding in the park.",
              score: score,
              thumbsUrl: const [
                "https://britishcolumbia.com/wp-content/uploads/2013/09/emerald-lake-yoho-national-park-british-columbia-730x485.jpg",
                "http://banffandbeyond.com/wp-content/uploads/2015/07/boat-at-emerald-lake-in-yoho-national-park-bc-600x400.jpg",
                "https://www.theworldisacircus.com/wp-content/uploads/2018/02/IMG_5680.jpg"
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              score++;
            });
          },
          child: const Icon(Icons.thumb_up),
        ));
  }
}
