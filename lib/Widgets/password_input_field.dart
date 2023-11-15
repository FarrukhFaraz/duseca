import 'package:duseca/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key , required this.controller, required this.validation});

  final TextEditingController controller;
  final List<String? Function(String?)> validation;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      validator:    FormBuilderValidators.compose(
        widget.validation
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,vertical: 8
        ),
        hintText: '',

        suffixIcon:  InkWell(
            onTap: (){
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Icon(_isObscure?Icons.visibility:Icons.visibility_off,color: AppColor.kGrey,size: 28,)),
      ),
    );
  }
}
