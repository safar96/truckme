import 'package:flutter/material.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/back_button_custom.dart';
import '../../widget/component/custom_button.dart';
import '../../widget/component/switch_profile.dart';

class ProfileP extends StatefulWidget {
  const ProfileP({super.key});

  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: getConfigWidth(0.3),
                child: Image.asset('assets/images/photo_user.png')),
            const Text(
              'Nuriddin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Divider(
              color: Colors.grey.shade300,
              indent: getConfigWidth(0.2),
              endIndent: getConfigWidth(0.2),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
              height: getConfigHeight(0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/ic_phone.png',width: 30,),
                      const SizedBox(width: 15,),
                      const Text(
                        '+998 90 123 45 67',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: getConfigWidth(0.1),
                  ),

                  Row(
                    children: [
                      Image.asset('assets/images/ic_mail.png',width: 30,),
                      const SizedBox(width: 15,),
                      const Text(
                        'nuriddin@truck.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: getConfigWidth(0.1),
                  ),

                  Row(
                    children: [
                      Image.asset('assets/images/ic_facebook.png',width: 30,),
                      const SizedBox(width: 15,),
                      const Text(
                        '@nuriddintruck',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: getConfigHeight(0.03),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bildirishnomalar',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Haydovchi xabarlari qabul qilish uchun',
                      style: TextStyle(fontSize: 16,color: Colors.grey),),
                  ],
                ),
                SwitchProfile(),
              ],
            ),

            SizedBox(height: getConfigHeight(0.02),),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: getConfigHeight(0.1),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F8F9),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: getConfigWidth(0.1),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/uzb.png',
                        ),
                        scale: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getConfigWidth(0.9) * 0.65,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Uzbek",
                        style: TextStyle(fontSize: 20, color: Color(0xFF3E4958)),
                      ),
                    ),
                  ),

                  // Container(
                  //     width: getConfigWidth(0.4) * 0.2,
                  //     decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage(
                  //           "assets/images/ic_arrow.png",
                  //         ),
                  //         scale: 1.5,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),

            SizedBox(height: getConfigHeight(0.06),),

            SizedBox(
              height: getConfigHeight(0.07),
              width: getConfigWidth(0.9),
              child: CustomButton(
                name: "Saqlash",
                textSize: 18,
                textColor: Colors.white,
                radius: 15,
                colorButton: Constants.primaryColor,
                onTap: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



