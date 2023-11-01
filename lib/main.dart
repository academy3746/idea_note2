import 'package:flutter/material.dart';
import 'package:idea_note2/data/db_config.dart';
import 'package:idea_note2/features/screens/edit_screen/edit_screen.dart';
import 'package:idea_note2/features/screens/main_screen/main_screen.dart';
import 'package:idea_note2/features/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아이디어노트',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        /// Edit Mode
        if (settings.name == EditScreen.routeName) {
          final IdeaInfo? ideaInfo = settings.arguments as IdeaInfo?;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return EditScreen(ideaInfo: ideaInfo);
            },
          );
        }
        return null;
      },
    );
  }
}
