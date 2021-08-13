import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/circular_img.dart';
import 'package:myapp/components/radius_icon_button.dart';
import 'package:myapp/utils/hex_color.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EDEBFB'),
      extendBody: true,
      body: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: const [0.3, 0.5, 0.9],
                  colors: [HexColor('#9A8FED'), HexColor('#C6C0F3'), HexColor('#F4BBEE')])),
          child: Column(
            children: [
              AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                leading: RadiusIconBtn(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  icon: Icons.reply,
                  padding: 5,
                  background: HexColor('#EDEBFB'),
                  margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  boxShadow: const [BoxShadow(color: Colors.deepPurpleAccent, blurRadius: 3)],
                ),
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: RadiusImage(
                            border: Border.all(color: HexColor('#F4BBEE'), width: 1),
                            image: const NetworkImage(
                                'http://47.103.211.10:9090/static/images/avatar.png'),
                            widthAndHeight: 60,
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5, left: 0),
                                  child: Text(
                                    'Sky',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'QQ:1434288209',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt,
                            color: Colors.black,
                            size: 25,
                          ),
                          Text('1234')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
