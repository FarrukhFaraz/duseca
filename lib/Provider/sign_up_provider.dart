import 'package:duseca/Screens/pick_ride.dart';
import 'package:duseca/Utils/functions.dart';
import 'package:duseca/Utils/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../Utils/messages.dart';

class SignupProvider extends ChangeNotifier {
  bool _loader = false;
  bool _isCheck = false;
  bool _isPassenger = false;
  bool _isDriver = false;
  final _signupFormKey = GlobalKey<FormState>();
  PhoneNumber _phoneNumber =
      PhoneNumber(isoCode: 'PK', dialCode: '+92', phoneNumber: '0310-XXXXXXX');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool get loader => _loader;

  changeLoader(bool val) {
    _loader = val;
    notifyListeners();
  }

  bool get isCheck => _isCheck;

  set isCheck(bool val) {
    _isCheck = val;
    notifyListeners();
  }

  bool emailValidate(TextEditingController controller) {
    bool val = AppFunctions().emailValidator(controller.text);
    return val;
  }

  bool get isPassenger => _isPassenger;

  set isPassenger(bool val) {
    _isPassenger = val;
    _isDriver = false;
    notifyListeners();
  }

  void setPassenger() {
    _isPassenger = true;
    _isDriver = false;
    notifyListeners();
  }

  bool get isDriver => _isDriver;

  set isDriver(bool val) {
    _isDriver = val;
    _isPassenger = false;
    notifyListeners();
  }

  void setDriver() {
    _isPassenger = false;
    _isDriver = true;
    notifyListeners();
  }

  TextEditingController get nameController => _nameController;

  TextEditingController get mailController => _mailController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get rePasswordController => _rePasswordController;

  GlobalKey<FormState> get signupFormKey => _signupFormKey;

  PhoneNumber get phoneNumber => _phoneNumber;

  set phoneNumber(PhoneNumber phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  Future<PhoneNumber> getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    return number;
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  createAccount(BuildContext context) {
    if (_isCheck) {
      if(validateAndSave()){
        if (_isDriver || _isPassenger) {
          navReplace(context, const PickRideScreen());
        } else {
          showSnackMessage(
              context, 'Please select type i.e Passenger or Driver');
        }
      }
    }
  }
}
