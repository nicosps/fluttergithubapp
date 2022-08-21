import 'package:flutter/material.dart';
import 'package:githubapp/repository/models/repository_error.dart';
import 'package:githubapp/repository/models/repository_model.dart';
import 'package:githubapp/repository/repo/repository_services.dart';

import '../../user_contributor/repo/api_status.dart';

class RepositoryViewModel extends ChangeNotifier {
  bool _loading = false;
  final String _searchText = "";
  RepositoryModel _userListModel = RepositoryModel();
  RepositoryError _userError = RepositoryError();
  final TextEditingController _searchQuery = TextEditingController();

  bool get loading => _loading;
  String get searchText => _searchText;
  TextEditingController get searchQuery => _searchQuery;
  RepositoryModel get userListModel => _userListModel;
  RepositoryError get userError => _userError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(RepositoryError userError) {
    _userError = userError;
  }

  getUsers(String query) async {
    setLoading(true);
    var response = await RepositoryServices.searchRepository(query);

    if (response is Success) {
      _userListModel = response.response as RepositoryModel;
    }
    if (response is Failure) {
      RepositoryError userError = RepositoryError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
