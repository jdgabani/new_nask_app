import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_nask_app/Api/Model/Response_Model/create_user_response_model.dart';
import 'package:new_nask_app/Api/View_Model/user_create_view_model.dart';
import 'package:new_nask_app/Constants/color.dart';
import 'package:new_nask_app/Constants/font_style.dart';
import '../../Api/api_response.dart';
import '../../Constants/image_path.dart';
import '../Common_Textformfield/common_textformfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isvisiblityone = false;
  bool isvisiblitytwo = false;

  UserCreateViewModel userCreateViewModel = Get.put(UserCreateViewModel());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
        title: const Text(
          "Register",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height * 0.42,
                color: AppColor.grey.withOpacity(0.1),
                child: Image.asset(
                  ImagePath.registerImage,
                ),
              ),
              Positioned(
                left: 20,
                top: height * .35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Welcome to",
                          style: FontTextStyle.hedYellow15bold,
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          "SkoolMonk",
                          style: FontTextStyle.hedBlack18bold,
                        ),
                      ],
                    ),
                    Text(
                      "Enter your details to register",
                      style: FontTextStyle.hedGrey18bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonTextFormField(
                          controller: userCreateViewModel.firstNameController,
                          label: 'First Name',
                          keyboardType: TextInputType.name,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: CommonTextFormField(
                          controller: userCreateViewModel.lastNameController,
                          label: 'Last Name',
                          keyboardType: TextInputType.name,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextFormField(
                    controller: userCreateViewModel.mobileNumberController,
                    label: 'Mobile Number',
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextFormField(
                    controller: userCreateViewModel.emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextFormField(
                    controller: userCreateViewModel.passwordController,
                    label: 'Password (Minimum 8 Characters)',
                    suffixIcon: InkResponse(
                      onTap: () {
                        setState(() {
                          isvisiblityone = !isvisiblityone;
                        });
                      },
                      child: isvisiblityone == true
                          ? const Icon(Icons.visibility_off,
                              color: AppColor.primary)
                          : const Icon(Icons.visibility,
                              color: AppColor.primary),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isvisiblityone,
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextFormField(
                    controller: userCreateViewModel.confirmPasswordController,
                    label: 'Confirm Password (Minimum 8 Characters)',
                    suffixIcon: InkResponse(
                      onTap: () {
                        setState(() {
                          isvisiblitytwo = !isvisiblitytwo;
                        });
                      },
                      child: isvisiblitytwo == true
                          ? const Icon(
                              Icons.visibility_off,
                              color: AppColor.primary,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: AppColor.primary,
                            ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isvisiblitytwo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: Colors.orangeAccent,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked = newBool;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                            text: "I agree to the",
                            style: FontTextStyle.checkGrey10w500,
                            children: [
                              TextSpan(
                                text: " TERMS & CONDITION",
                                style: FontTextStyle.CheckYellow11normal,
                              ),
                              TextSpan(
                                text: " and",
                                style: FontTextStyle.checkGrey10w500,
                              ),
                              TextSpan(
                                text: " PRIVACY POLICY",
                                style: FontTextStyle.CheckYellow11normal,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                GetBuilder<UserCreateViewModel>(builder: (controller) {
                  if (controller.apiResponse.status == Status.INITIAL ||
                      controller.apiResponse.status == Status.COMPLETE ||
                      controller.apiResponse.status == Status.ERROR) {
                    return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) ;
                          String client_key = '1595922666X5f1fd8bb5f662';
                          String device_type = 'MOB';
                          await controller.userCreateViewModel({
                            'client_key': client_key,
                            'device_type': device_type,
                            'fname':
                                userCreateViewModel.firstNameController.text,
                            'lname':
                                userCreateViewModel.lastNameController.text,
                            'mobile':
                                userCreateViewModel.mobileNumberController.text,
                            'email': userCreateViewModel.emailController.text,
                            'password':
                                userCreateViewModel.passwordController.text,
                            'confirm_password': userCreateViewModel
                                .confirmPasswordController.text,
                            'dob': "1",

                            // "password": userCreateViewModel..text,
                          });
                          controller.clearData();
                          if (controller.apiResponse.status ==
                              Status.COMPLETE) {
                            CreateUserResponseModel data =
                                controller.apiResponse.data;

                            if (data.status == "COMPLETE") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                            } else {
                              print('error');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 150, vertical: 15)),
                        child: const Text(
                          "Register",
                          style: TextStyle(color: AppColor.black),
                        ));
                  } else {
                    return const CircularProgressIndicator(
                      backgroundColor: AppColor.white,
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
