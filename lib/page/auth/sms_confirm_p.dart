import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/component/size_config.dart';
import '../../model/auth/success_message.dart';
import '../../provider/auth_provider.dart';
import '../../widget/component/custom_button.dart';

class SmsConfirmP extends StatefulWidget {
  const SmsConfirmP({Key? key}) : super(key: key);

  @override
  State<SmsConfirmP> createState() => _SmsConfirmPState();
}

class _SmsConfirmPState extends State<SmsConfirmP> {
  int _secondsRemaining = 60;
  String _remainSecond = "";
  bool _enableResend = false;
  late Timer timer;
  bool _isLoading = false;
  String _phone = "";
  String _code = "";
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _getInfo() async {
    // final pref = await SharedPreferences.getInstance();
    // _phone = pref.getString("phone") ?? "";
  }

  // void _smsConfirm() async {
  //   if (_pinController.text.length != 6) {
  //     SnackBar snackBar = SnackBar(
  //       backgroundColor: Theme.of(context).cardColor,
  //       behavior: SnackBarBehavior.floating,
  //       content: Text(
  //         "101".tr(),
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //       duration: const Duration(seconds: 2),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } else {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     SuccessMessage successMessage =
  //         await Provider.of<AuthProvider>(context, listen: false).smsConfirm(_pinController.text);
  //     if (successMessage.message == Message.Succes) {
  //       if (!mounted) return;
  //       Navigator.of(context).pushNamedAndRemoveUntil('/main-page', (Route<dynamic> route) => false);
  //     } else {
  //       _alert("1".tr(), successMessage.body);
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
  //
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

  @override
  initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _getInfo().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    // _listenSmsCode();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsRemaining != 0) {
        setState(() {
          _secondsRemaining--;
          _remainSecond =
              "${(_secondsRemaining / 60).truncate().toString().padLeft(2, '0')} : ${(_secondsRemaining % 60).toString().padLeft(2, "0")}";
        });
      } else {
        setState(() {
          _enableResend = true;
        });
      }
    });
  }

  void _resendCode() async {
    setState(() {
      _isLoading = true;
    });
    // String smsTag = await SmsAutoFill().getAppSignature;
    if (!mounted) return;
    // await Provider.of<AuthProvider>(context, listen: false).phoneRequest(_phone, smsTag);
    setState(() {
      _secondsRemaining = 60;
      _enableResend = false;
      _isLoading = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: getConfigFullHeight(),
            width: getConfigWidth(1),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Column(
                children: [
                  SizedBox(
                    height: getConfigTopHeight(),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.08),
                    width: getConfigWidth(1),
                    child: Row(
                      children: [
                        Container(
                          height: getConfigHeight(0.05),
                          width: getConfigWidth(0.15),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: getConfigHeight(0.08),
                          width: getConfigWidth(0.7),
                          alignment: Alignment.center,
                          child: Text(
                            "Kodni tasdiqlang",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.titleSmall?.color,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getConfigHeight(0.08),
                          width: getConfigWidth(0.15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.15),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.2),
                    width: getConfigWidth(0.5),
                    child: const Text(
                      "SMS orqali\n +998 99 123 45 67\nraqamiga kod yuborildi",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF97ADB6),
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.08),
                    width: getConfigWidth(0.8),
                    child: PinFieldAutoFill(
                      decoration: UnderlineDecoration(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0DB65B),
                        ),
                        colorBuilder: const FixedColorBuilder(
                          Color(0xFF0DB65B),
                        ),
                        lineHeight: 1.5,
                      ),
                      enableInteractiveSelection: false,
                      currentCode: _code,
                      onCodeSubmitted: (code) {},
                      focusNode: _focusNode,
                      onCodeChanged: (code) {
                        if (code!.length == 6) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                        setState(() {
                          _code = code;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "Resend code : ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0DB65B),
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ),
                        _enableResend
                            ? IconButton(
                                onPressed: () {
                                  _resendCode();
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Color(0xFF0DB65B),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  _remainSecond,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0DB65B),
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
