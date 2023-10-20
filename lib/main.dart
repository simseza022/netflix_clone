import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_flix/screens/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:popcorn_flix/screens/signIn_screen.dart';
import 'package:popcorn_flix/screens/signup_screen.dart';
import 'firebase_options.dart';



class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = 1024 * 1024 * 500; // 100 MB
    return imageCache;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kReleaseMode) {
    CustomImageCache();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
  }
}