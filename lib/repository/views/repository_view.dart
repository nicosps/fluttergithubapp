import 'package:flutter/material.dart';
import 'package:githubapp/repository/view_models/repository_view_model.dart';
import 'package:githubapp/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../component/app_loading.dart';
import '../models/repository_model.dart';

class RepositoryView extends StatefulWidget {
  const RepositoryView({Key? key}) : super(key: key);

  @override
  State<RepositoryView> createState() => _RepositoryViewState();
}

class _RepositoryViewState extends State<RepositoryView> {
  final FocusNode myFocusNode = FocusNode();
  late RepositoryViewModel usersViewModel;

  final key = GlobalKey<ScaffoldState>();

  bool isSearching = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    RepositoryViewModel usersViewModel = context.watch<RepositoryViewModel>();

    return Column(
      children: [
        searchTextField(usersViewModel),
        const SizedBox(height: 10),
        repositoryCard(usersViewModel),
      ],
    );
  }

  searchTextField(RepositoryViewModel usersViewModel) {
    return TextField(
      onSubmitted: (val) {
        usersViewModel.getUsers(usersViewModel.searchQuery.text);
      },
      onChanged: (val) {
        usersViewModel.getUsers(usersViewModel.searchQuery.text);
      },
      onEditingComplete: () {
        usersViewModel.getUsers(usersViewModel.searchQuery.text);
      },
      controller: usersViewModel.searchQuery,
      style: const TextStyle(color: HexColors.textColor),
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: false,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(
            Icons.search,
            color: HexColors.textColor,
            size: 35,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 14),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: HexColors.textColor, width: 1.2),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            usersViewModel.searchQuery.clear();
            usersViewModel.getUsers(usersViewModel.searchQuery.text);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.close,
              color: HexColors.textColor,
              size: 25,
            ),
          ),
        ),
        hintText: "Search",
        hintStyle: const TextStyle(color: HexColors.textColor),
      ),
    );
  }

  repositoryCard(RepositoryViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    } else if (usersViewModel.searchQuery.text == "") {
      return Center(
          child: Text(
        'Begin Search by typing on search bar',
        style: textStyle(),
      ));
    } else if (usersViewModel.searchQuery.text.length < 3) {
      return Center(
          child: Text(
        'Min 3 letters',
        style: textStyle(),
      ));
    } else if (usersViewModel.userListModel.items.isEmpty) {
      return Center(
          child: Text(
        'Empty Result',
        style: textStyle(),
      ));
    } else {
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemBuilder: (context, index) {
            RepositoryModel userModel = usersViewModel.userListModel;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${userModel.items[index].name}",
                  style: textStyle(),
                ),
                const SizedBox(height: 7),
                Text(
                  "Url : ${userModel.items[index].url}",
                  style: textStyle(),
                ),
                const SizedBox(height: 7),
                Text(
                  "Owner : ${userModel.items[index].owner.login}",
                  style: textStyle(),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: usersViewModel.userListModel.items.length,
        ),
      );
    }
  }

  TextStyle textStyle() {
    return const TextStyle(
      color: HexColors.textColor,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
  }
}
