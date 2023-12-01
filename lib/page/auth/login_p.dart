import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/page/auth/registration_p.dart';
import 'package:truckme/widget/component/password_input_form.dart';
import 'package:truckme/widget/component/phone_input_form.dart';
import '../../core/component/size_config.dart';
import '../../core/util/util_file.dart';
import '../../model/auth/success_message.dart';
import '../../provider/auth_provider.dart';
import '../../widget/component/custom_button.dart';

class LoginP extends StatefulWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  State<LoginP> createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
  bool _isLoading = false;
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void _login() async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    setState(() {
      _isLoading = true;
    });
    SuccessMessage successMessage = await provider.login(
      _controllerPhone.text,
      _controllerPassword.text,
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
    _controllerPassword.dispose();
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
                  "Tizimga kirish",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhoneInputForm(
                      titleHeight: getConfigHeight(0.06),
                      titleWidth: getConfigWidth(0.8),
                      title: "Telefon",
                      inputHeight: getConfigHeight(0.07),
                      inputWidth: getConfigWidth(0.8),
                      placeholder: "Raqam kiriting!",
                      controller: _controllerPhone,
                    ),
                    PasswordInputForm(
                      titleHeight: getConfigHeight(0.06),
                      titleWidth: getConfigWidth(0.8),
                      title: "Parol",
                      inputHeight: getConfigHeight(0.07),
                      inputWidth: getConfigWidth(0.8),
                      placeholder: "Parol kiriting!",
                      controller: _controllerPassword,
                      inputType: TextInputType.name,
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
                        name: "Tizimga kirish",
                        textSize: 18,
                        textColor: const Color(0xFFFFFFFF),
                        radius: 15,
                        colorButton: const Color(0xFF0DB65B),
                        onTap: () {
                          _login();
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
                        text: "Akkauntingiz yo'qmi? ",
                        style: TextStyle(
                          color: Color(0xFF97ADB6),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Ro'yxatdan o'tish",
                        style: const TextStyle(
                          color: Color(0xFF0DB65B),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationP(),
                              ),
                            );
                          },
                      ),
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
