import 'package:flutter/material.dart';
import 'package:githubapp/repository/view_models/repository_view_model.dart';
import 'package:githubapp/tab/views/tab_bar_views.dart';
import 'package:githubapp/user_contributor/view_models/user_contributor_view_models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserContributorViewModel()),
        ChangeNotifierProvider(create: (_) => RepositoryViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const TabBarViews(),
      ),
    );
  }
}
