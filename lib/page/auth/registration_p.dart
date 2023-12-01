import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/util/util_file.dart';
import 'package:truckme/page/auth/login_p.dart';
import 'package:truckme/widget/component/password_input_form.dart';
import 'package:truckme/widget/component/phone_input_form.dart';
import 'package:truckme/widget/component/text_input_form.dart';
import '../../core/component/size_config.dart';
import '../../model/auth/success_message.dart';
import '../../provider/auth_provider.dart';
import '../../widget/component/custom_button.dart';

class RegistrationP extends StatefulWidget {
  const RegistrationP({Key? key}) : super(key: key);

  @override
  State<RegistrationP> createState() => _RegistrationPState();
}

class _RegistrationPState extends State<RegistrationP> {
  bool _isLoading = false;
  bool _isPassword = false;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword1 = TextEditingController();
  final TextEditingController _controllerPassword2 = TextEditingController();

  void _register() async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    setState(() {
      _isLoading = true;
    });
    // String smsTag = await SmsAutoFill().getAppSignature;
    SuccessMessage successMessage = await provider.registerUser(
      _controllerName.text,
      _controllerSurname.text,
      _controllerPhone.text,
      _controllerPassword1.text,
    );
    if (successMessage.message == Message.Login) {
      navigator.pushNamed("/sms");
    } else {
      _getAlert("Xatolik", successMessage.body);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _getAlert(String title, String body) {
    alert(context, title, body);
  }


  @override
  void dispose() {
    _controllerName.dispose();
    _controllerSurname.dispose();
    _controllerPassword1.dispose();
    _controllerPassword2.dispose();
    _controllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: getConfigFullHeight(),
          width: getConfigWidth(1),
          child: Column(
            children: [
              SizedBox(
                height: getConfigTopHeight(),
              ),
              Container(
                height: getConfigHeight(0.08),
                alignment: Alignment.center,
                child: Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.5),
                child: _isPassword
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PasswordInputForm(
                            titleHeight: getConfigHeight(0.06),
                            titleWidth: getConfigWidth(0.8),
                            title: "Parol",
                            inputHeight: getConfigHeight(0.07),
                            inputWidth: getConfigWidth(0.8),
                            placeholder: "Parol kiriting!",
                            controller: _controllerPassword1,
                            inputType: TextInputType.name,
                          ),
                          PasswordInputForm(
                            titleHeight: getConfigHeight(0.06),
                            titleWidth: getConfigWidth(0.8),
                            title: "Qaytadan parol",
                            inputHeight: getConfigHeight(0.07),
                            inputWidth: getConfigWidth(0.8),
                            placeholder: "Qaytadan parol kiriting!",
                            controller: _controllerPassword2,
                            inputType: TextInputType.emailAddress,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextInputForm(
                            titleHeight: getConfigHeight(0.06),
                            titleWidth: getConfigWidth(0.8),
                            title: "Ism",
                            inputHeight: getConfigHeight(0.07),
                            inputWidth: getConfigWidth(0.8),
                            placeholder: "Ism kiriting!",
                            controller: _controllerName,
                            inputType: TextInputType.name,
                          ),
                          TextInputForm(
                            titleHeight: getConfigHeight(0.06),
                            titleWidth: getConfigWidth(0.8),
                            title: "E-pochta",
                            inputHeight: getConfigHeight(0.07),
                            inputWidth: getConfigWidth(0.8),
                            placeholder: "E-pochta kiriting!",
                            controller: _controllerSurname,
                            inputType: TextInputType.emailAddress,
                          ),
                          PhoneInputForm(
                            titleHeight: getConfigHeight(0.06),
                            titleWidth: getConfigWidth(0.8),
                            title: "Telefon",
                            inputHeight: getConfigHeight(0.07),
                            inputWidth: getConfigWidth(0.8),
                            placeholder: "Raqam kiriting!",
                            controller: _controllerPhone,
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: getConfigHeight(0.05),
              ),
              SizedBox(
                height: getConfigHeight(0.07),
                width: getConfigWidth(0.85),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        name: "Ro'yxatdan o'tish",
                        textSize: 18,
                        textColor: const Color(0xFFFFFFFF),
                        radius: 15,
                        colorButton: const Color(0xFF0DB65B),
                        onTap: () {
                          if (!_isPassword) {
                            setState(() {
                              _isPassword = true;
                            });
                          } else {
                            if(_controllerPassword1.text == _controllerPassword2.text){
                              _register();
                            }else{
                              alert(context, "Xatolik", "Parollar bir biriga mos emas!!!");
                            }
                          }
                        },
                      ),
              ),
              SizedBox(
                height: getConfigHeight(0.2),
              ),
              SizedBox(
                height: getConfigHeight(0.1),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(height: 1.5),
                    children: [
                      const TextSpan(
                        text: "Akkauntingiz bormi? ",
                        style: TextStyle(
                          color: Color(0xFF97ADB6),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                          text: "Tizimga kirish",
                          style: const TextStyle(
                            color: Color(0xFF0DB65B),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginP(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
