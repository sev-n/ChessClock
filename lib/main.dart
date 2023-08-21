import 'package:chess_clock/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<PlayerOne>(create: (_) => PlayerOne()),
          ChangeNotifierProvider<PlayerTwo>(create: (_) => PlayerTwo()),
        ],
        child: const Home(),
      ),
    );
  }
}