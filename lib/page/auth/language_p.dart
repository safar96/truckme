import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/page/auth/login_p.dart';
import 'package:truckme/page/auth/registration_p.dart';
import 'package:truckme/page/auth/sms_confirm_p.dart';
import 'package:truckme/widget/component/language_card.dart';
import 'package:truckme/widget/component/password_input_form.dart';
import 'package:truckme/widget/component/phone_input_form.dart';
import 'package:truckme/widget/component/text_input_form.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/custom_button.dart';

class LanguageP extends StatefulWidget {
  const LanguageP({Key? key}) : super(key: key);

  @override
  State<LanguageP> createState() => _LanguagePState();
}

class _LanguagePState extends State<LanguageP> {
  bool _isLoading = false;
  int _selectedLang = 0;

  // void _register() async {
  //   final provider = Provider.of<AuthProvider>(context, listen: false);
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String smsTag = await SmsAutoFill().getAppSignature;
  //   SuccessMessage successMessage = await provider.registerUser(
  //     _controllerName.text,
  //     _controllerSurname.text,
  //     smsTag,
  //   );
  //   if (successMessage.message == Message.Login) {
  //     if (mounted) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const SmsConfirmPage(),
  //         ),
  //       );
  //     }
  //   } else {
  //     _alert("1".tr(), successMessage.body);
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  // void _alert(String title, String body) async {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: Text(title),
  //       content: Text(body),
  //       actions: <Widget>[
  //         CupertinoDialogAction(
  //           isDefaultAction: true,
  //           child: Text("2".tr()),
  //           onPressed: () async {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _launchURL(String url) async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     final bool nativeAppLaunchSucceeded = await launchUrl(
  //       uri,
  //       mode: LaunchMode.externalApplication,
  //     );
  //     if (!nativeAppLaunchSucceeded) {
  //       await launchUrl(
  //         uri,
  //         mode: LaunchMode.inAppWebView,
  //       );
  //     }
  //   } else {
  //     _alert("1".tr(), "20".tr());
  //   }
  // }

  @override
  void dispose() {
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
                  "Til tanlang",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: getConfigHeight(0.35),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/language_logo_2.png"),
                    scale: 1.8,
                  ),
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LanguageCard(
                      height: getConfigHeight(0.08),
                      width: getConfigWidth(0.9),
                      imageUrl: "assets/images/uzb.png",
                      title: "Uzbek",
                      isSelected: _selectedLang == 1,
                      onTap: () {
                        setState(() {
                          _selectedLang = 1;
                        });
                      },
                    ),
                    LanguageCard(
                      height: getConfigHeight(0.08),
                      width: getConfigWidth(0.9),
                      imageUrl: "assets/images/russia.png",
                      title: "Rus",
                      isSelected: _selectedLang == 2,
                      onTap: () {
                        setState(() {
                          _selectedLang = 2;
                        });
                      },
                    ),
                    LanguageCard(
                      height: getConfigHeight(0.08),
                      width: getConfigWidth(0.9),
                      imageUrl: "assets/images/united-states.png",
                      title: "English",
                      isSelected: _selectedLang == 3,
                      onTap: () {
                        setState(() {
                          _selectedLang = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.1),
              ),
              SizedBox(
                height: getConfigHeight(0.07),
                width: getConfigWidth(0.85),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        name: "Davom etish",
                        textSize: 18,
                        textColor: const Color(0xFFFFFFFF),
                        radius: 15,
                        colorButton: const Color(0xFF0DB65B),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginP(),
                            ),
                          );
                          // _register();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
