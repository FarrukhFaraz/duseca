import 'package:duseca/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../Provider/sign_up_provider.dart';
import '../Utils/colors.dart';
import '../Utils/constants.dart';
import '../Widgets/circle.dart';
import '../Widgets/input_field.dart';
import '../Widgets/password_input_field.dart';
import '../Widgets/sign_up_duseca_widget.dart';
import '../Widgets/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03),
                      signUpDusecaWidget(context, size),
                      SizedBox(height: size.height * 0.04),
                      textWidget(context, AppConstants.signUp_today,
                          color: AppColor.kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      textWidget(context, AppConstants.provide_credential_info,
                          color: AppColor.kBlack.withOpacity(0.5)),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Consumer<SignupProvider>(
                    builder: (context, provider, child) {
                      return Form(
                        key: provider.signupFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(context, AppConstants.your_name,
                                color: AppColor.kBlack.withOpacity(0.65)),
                            const SizedBox(height: 8),
                            inputFieldWidget(
                                provider.nameController, 'e.g. John Doe',
                                inputType: TextInputType.name),
                            const SizedBox(height: 16),
                            textWidget(context, AppConstants.your_mail,
                                color: AppColor.kBlack.withOpacity(0.65)),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: provider.mailController,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Required*'),
                                FormBuilderValidators.email(
                                    errorText: 'Not a valid email'),
                              ]),
                              onChanged: (val){
                                provider.emailValidate(provider.mailController);
                              },
                              decoration: InputDecoration(
                                isDense: false,
                                hintText: 'yourmail@gmail.com',
                                suffixIcon: provider
                                        .emailValidate(provider.mailController)
                                    ? const Icon(Icons.check,
                                        color: AppColor.kGreen)
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 16),
                            textWidget(context, AppConstants.phone_no,
                                color: AppColor.kBlack.withOpacity(0.65)),
                            const SizedBox(height: 8),
                            InternationalPhoneNumberInput(
                              onInputChanged: (number) {
                                provider.phoneNumber = number;
                              },

                              onInputValidated: (bool value) {},
                              onSaved: (PhoneNumber number) {},
                              textFieldController: provider.phoneController,
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.onUserInteraction,
                              selectorTextStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                setSelectorButtonAsPrefixIcon: true,
                                leadingPadding: 0,
                                showFlags: true,
                                trailingSpace: true,
                              ),
                              spaceBetweenSelectorAndTextField: 0,
                              scrollPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              formatInput: false,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputDecoration: InputDecoration(
                                hintText: '0310-XXXXXXX',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: AppColor.kGrey, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: AppColor.kGreen, width: 1)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: AppColor.kGrey, width: 1)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: AppColor.kMain_2),
                                ),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                              ),
                              textStyle: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 16),
                            textWidget(context, AppConstants.password,
                                color: AppColor.kBlack.withOpacity(0.65)),
                            const SizedBox(height: 8),
                            PasswordInputField(
                              controller: provider.passwordController,
                              validation: [
                                FormBuilderValidators.required(
                                    errorText: 'Required*'),
                                FormBuilderValidators.minLength(8,
                                    errorText: 'At least 8 character long'),
                                FormBuilderValidators.match(r'^(?=.*?[A-Z])',
                                    errorText:
                                        'password must have at least one Capital letter'),
                                FormBuilderValidators.match(r'^(?=.*?[a-z])',
                                    errorText:
                                        'password must have at least one Small letter'),
                                FormBuilderValidators.match(
                                    r'^(?=.*?[^A-Za-z0-9])',
                                    errorText:
                                        'password must have at least one Symbol'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            textWidget(context, AppConstants.confirm_password,
                                color: AppColor.kBlack.withOpacity(0.65)),
                            const SizedBox(height: 8),
                            PasswordInputField(
                              controller: provider.rePasswordController,
                              validation: [
                                FormBuilderValidators.required(errorText: 'Required*'),
                                FormBuilderValidators.equal( provider.passwordController.text,errorText: 'Password not match'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                circleWidget(provider.isPassenger,
                                    provider.setPassenger),
                                const SizedBox(width: 8),
                                textWidget(context, AppConstants.passenger,
                                    fontWeight: provider.isPassenger
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    fontSize: 15,
                                    color: provider.isPassenger
                                        ? AppColor.kMain_2
                                        : AppColor.kBlack.withOpacity(0.65)),
                                const SizedBox(width: 16),
                                circleWidget(
                                    provider.isDriver, provider.setDriver),
                                const SizedBox(width: 8),
                                textWidget(context, AppConstants.driver,
                                    fontWeight: provider.isDriver
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    fontSize: 15,
                                    color: provider.isDriver
                                        ? AppColor.kMain_2
                                        : AppColor.kBlack.withOpacity(0.65)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    provider.isCheck = !provider.isCheck;
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Icon(
                                    provider.isCheck
                                        ? Icons.check_circle_sharp
                                        : Icons.circle_outlined,
                                    size: 28,
                                    color: provider.isCheck
                                        ? AppColor.kGreen
                                        : AppColor.kBlack.withOpacity(0.65),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: textWidget(
                                    context,
                                    AppConstants.password_info,
                                    textAlign: TextAlign.start,
                                    color: AppColor.kBlack.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                provider.createAccount(context);
                              },
                              child: btnWidget(context, provider.isCheck, AppConstants.create_account, 45, double.infinity),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
