import 'dart:io';

import 'package:githubapp/user_contributor/models/user_contributor_model.dart';
import 'package:githubapp/user_contributor/repo/api_status.dart';
import 'package:githubapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserContributorsServices {
  static Future<Object> getUserContributor() async {
    try {
      var response = await http.get(
        Uri.parse("$githubUrl/repos/square/retrofit/contributors"),
      );

      if (successStatusCode == response.statusCode) {
        return Success(
          response: userContributorModelFromJson(response.body),
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
