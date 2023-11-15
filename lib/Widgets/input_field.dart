import 'package:duseca/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Widget inputFieldWidget(
  TextEditingController controller,
  String hintText, {
  TextInputType? inputType,
  String? errorText,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      suffixIcon: const SizedBox(),
      errorText: errorText,
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Required*'),
    ]),
  );
}
