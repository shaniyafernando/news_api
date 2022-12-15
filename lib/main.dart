import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_api/api/news_api.dart';
import 'package:news_api/view/auth_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDSOwtlk_4duHf_i-apK7BF68UaxlZMd4A',
      appId: '1:402288741727:android:aa1ec51a3f82ec60febaea',
      messagingSenderId: '402288741727',
      projectId: 'news-api-v1',
      storageBucket: 'news-api-v1.appspot.com',
    )
  );
  NewsApi newsApi = NewsApi();
  print(newsApi.getGlobalNews());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AuthView(),
    );
  }
}

