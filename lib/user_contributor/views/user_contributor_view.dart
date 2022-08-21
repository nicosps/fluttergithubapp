import 'package:flutter/material.dart';
import 'package:githubapp/user_contributor/models/user_contributor_model.dart';
import 'package:githubapp/user_contributor/view_models/user_contributor_view_models.dart';
import 'package:githubapp/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../component/app_loading.dart';

class UserContributorView extends StatelessWidget {
  const UserContributorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserContributorViewModel usersViewModel =
        context.watch<UserContributorViewModel>();
    return userContributorCard(usersViewModel);
  }

  userContributorCard(UserContributorViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      itemBuilder: (context, index) {
        UserContributorModel userModel = usersViewModel.userListModel[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              userModel.avatarUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.login,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    userModel.url,
                    style: const TextStyle(
                      color: HexColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    userModel.type,
                    style: const TextStyle(
                      color: HexColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usersViewModel.userListModel.length,
    );
  }
}
