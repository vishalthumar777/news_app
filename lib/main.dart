import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machers_assignment/firebase_options.dart';
import 'package:machers_assignment/view_models/auth_view_model.dart';
import 'package:machers_assignment/view_models/news_view_model.dart';
import 'package:machers_assignment/views/login_view.dart';
import 'package:machers_assignment/views/news_list_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            return authViewModel.isSignedIn
                ? const NewsListView()
                : const LoginView();
          },
        ),
      ),
    );
  }
}
