import 'dart:io';

import 'package:githubapp/repository/models/repository_model.dart';
import 'package:githubapp/user_contributor/repo/api_status.dart';
import 'package:githubapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class RepositoryServices {
  static Future<Object> searchRepository(String seaarch) async {
    try {
      final queryParameters = {
        "q": seaarch,
      };
      final uri = Uri.https(
        "api.github.com",
        '/search/repositories',
        queryParameters,
      );
      final response = await http.get(uri);

      if (successStatusCode == response.statusCode) {
        return Success(
          response: repositoryModelFromJson(response.body),
        );
      }
      return Failure(
        code: userInvalidStatusCode,
        errorResponse: 'Invalid Response',
      );
    } on HttpException {
      return Failure(
        code: noInternetStatusCode,
        errorResponse: 'No Internet Connection',
      );
    } on SocketException {
      return Failure(
        code: noInternetStatusCode,
        errorResponse: 'No Internet Connection',
      );
    } on FormatException {
      return Failure(
        code: invalidFormatStatusCode,
        errorResponse: 'Invalid Format',
      );
    } catch (e) {
      return Failure(
        code: unknownErrorStatusCode,
        errorResponse: 'Unknown Error',
      );
    }
  }
}
