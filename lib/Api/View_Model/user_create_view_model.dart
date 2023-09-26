import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Response_Model/create_user_response_model.dart';
import '../Repo/create_user_repo.dart';
import '../api_response.dart';

class UserCreateViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  clearData() {
    firstNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    update();
  }

  Future<void> userCreateViewModel(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CreateUserResponseModel response =
          await UserCreateRepo.userCreateRepo(body: body);

      _apiResponse = ApiResponse.complete(response);
      log('userCreateViewModel----response---->>>>>>$response');
      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      log('userCreateViewMod el-------->>>>>>$e');
    }
    update();
  }
}
