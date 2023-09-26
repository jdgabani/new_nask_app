import 'dart:developer';

import '../Model/Response_Model/create_user_response_model.dart';
import '../api_handlers.dart';
import '../api_routs.dart';

class UserCreateRepo extends BaseService {
  static Future userCreateRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: BaseService.userCreateUrl,
        body: body,
        header: {
          'Authorization': '\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0',
          'Client-Service': 'frontend-client',
          'User-ID': '1',
          'Auth-Key': 'simplerestapi',
          'Content-Type': 'application/x-www-form-urlencoded',
          'client_key': '1595922666X5f1fd8bb5f662',
          'device_type': 'MOB',
        });

    print('++++++++++++++++++++++++RESPONSE   $response');
    CreateUserResponseModel createUserResponseModel =
        CreateUserResponseModel.fromJson(response);

    log('-----------------------$createUserResponseModel');
    // log('-----------------------${BaseService.userCreateUrl}');
    return createUserResponseModel;
  }
}
