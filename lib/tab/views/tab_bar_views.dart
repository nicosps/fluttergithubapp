import 'package:flutter/material.dart';
import 'package:githubapp/repository/views/repository_view.dart';
import 'package:githubapp/user_contributor/views/user_contributor_view.dart';
import 'package:githubapp/utils/colors.dart';

class TabBarViews extends StatelessWidget {
  const TabBarViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        primary: false,
        appBar: AppBar(
          backgroundColor: HexColors.appBarColor,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: HexColors.tabBarIndicatorColor,
            indicatorWeight: 5,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Repositories'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserContributorView(),
            RepositoryView(),
          ],
        ),
      ),
    );
  }
}
