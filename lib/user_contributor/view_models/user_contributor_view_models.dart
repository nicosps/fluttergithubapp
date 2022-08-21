import 'package:flutter/material.dart';
import 'package:githubapp/user_contributor/models/user_contributor_error.dart';
import 'package:githubapp/user_contributor/models/user_contributor_model.dart';
import 'package:githubapp/user_contributor/repo/api_status.dart';
import 'package:githubapp/user_contributor/repo/user_contributor_services.dart';

class UserContributorViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserContributorModel> _userListModel = [];
  UserContributorError _userError = UserContributorError();

  bool get loading => _loading;
  List<UserContributorModel> get userListModel => _userListModel;
  UserContributorError get userError => _userError;

  UserContributorViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserContributorError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserContributorsServices.getUserContributor();
    if (response is Success) {
      _userListModel = response.response as List<UserContributorModel>;
    }
    if (response is Failure) {
      UserContributorError userError = UserContributorError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
