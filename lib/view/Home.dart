import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:sweatbox2dot0/Controller/UserDataController.dart';
import 'package:sweatbox2dot0/Controller/ViewMainStateController.dart';
import 'package:sweatbox2dot0/Widget/RandomWod/randomwod.dart';
import 'package:sweatbox2dot0/Widget/RmPad/RmPad.dart';
import 'package:sweatbox2dot0/Widget/SweatRecord/SweatRecord.dart';
import 'package:sweatbox2dot0/Widget/UnitedTimer/UnitedTimer.dart';

class HomePage extends StatelessWidget {
  ScrollController homeScrollController = new ScrollController();
  var viewMainStateController = Get.put(ViewMainStateController());
  var userData = Get.put(UserController());
  HomePage() {
    homeScrollController.addListener(() {
      //print(homeScrollController.offset);
      if (homeScrollController.position.userScrollDirection != ScrollDirection.forward) {
        if (homeScrollController.offset >= 50) {
          viewMainStateController.showBars.value = false;
        }
      } else {
        viewMainStateController.showBars.value = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (value) {
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChrome.setEnabledSystemUIOverlays([]);
      },
      child: RelativeBuilder(builder: (context, height, width, sy, sx) {
        var paddingtop = 0.0;
        if (Platform.isIOS) {
          paddingtop = MediaQuery.of(context).padding.top;
        }
        return Scaffold(
            body: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          width: width,
          height: height,
          child: ListView(
            controller: homeScrollController,
            children: [
              Container(
                  width: width,
                  height: height - paddingtop,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: sx(15), right: sx(15), top: sx(70), bottom: sx(15)),
                          width: width,
                          height: sx(300),
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(),
                              Text("???????????? ????????????\n??????????????? ??????",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: sx(27))),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("???????????? >",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: sx(15))))
                            ],
                          )),
                      RandomWod(viewMainStateController: viewMainStateController, userData: userData)
                    ],
                  )),
              Container(
                width: width,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(sx(25)),
                      child: Text(
                        "??????????????? ?????????",
                        style: TextStyle(color: Colors.black, fontSize: sx(30)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: sx(25)),
                        color: Colors.black,
                        child: Image.asset("assets/video/Timer.gif")),
                    Container(
                      padding: EdgeInsets.all(sx(25)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "????????? ???????????? ????????? ??????",
                                style: TextStyle(color: Colors.black, fontSize: sx(25), fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45),
                                      ),
                                      primary: Colors.black,
                                      elevation: 0,
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(sx(10)),
                                      minimumSize: Size(sx(30), sx(30))),
                                  onPressed: () {
                                    Get.to(() => UnitedTimer(), transition: Transition.zoom);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: sx(80),
                                      height: sx(20),
                                      child: Text(
                                        "????????????",
                                        style: TextStyle(color: Colors.white, fontSize: sx(15)),
                                      ))),
                            ],
                          ),
                          Text(
                            "??? ????????? ???????????? ????????? ????????? ???????????? ?????????. ?????? ???????????? ????????? ?????????????????????.",
                            style: TextStyle(color: Colors.black, fontSize: sx(15), fontWeight: FontWeight.w100, height: 2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: sx(100),
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Text(
                        "??????",
                        style: TextStyle(color: Colors.white, fontSize: sx(30)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(sx(25)),
                      child: Text(
                        "????????? ?????????",
                        style: TextStyle(color: Colors.black, fontSize: sx(30)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: sx(25)),
                        color: Colors.black,
                        child: Image.asset("assets/video/Timer.gif")),
                    Container(
                      padding: EdgeInsets.all(sx(25)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "????????? ?????? ???????????? ?????????",
                                style: TextStyle(color: Colors.black, fontSize: sx(25), fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45),
                                      ),
                                      primary: Colors.black,
                                      elevation: 0,
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(sx(10)),
                                      minimumSize: Size(sx(30), sx(30))),
                                  onPressed: () {
                                    Get.to(() => SweatRecord());
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: sx(80),
                                      height: sx(20),
                                      child: Text(
                                        "????????????",
                                        style: TextStyle(color: Colors.white, fontSize: sx(15)),
                                      ))),
                            ],
                          ),
                          Text(
                            "????????? ????????? ????????????, ????????? ????????? ????????? ???????????????. ???????????? ????????? ???????????? ????????????",
                            style: TextStyle(color: Colors.black, fontSize: sx(15), fontWeight: FontWeight.w100, height: 2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(sx(30)),
                      width: width,
                      height: sx(730),
                      alignment: Alignment.center,
                      child: RmPad(
                        userData: userData,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: sx(90),
                color: Color(0xffebebeb),
                alignment: Alignment.center,
                child: Text(
                  "SWBX.copy right reserved SWERVE",
                  style: TextStyle(color: Colors.grey[700], fontSize: sx(10), letterSpacing: 1.5),
                ),
              )
            ],
          ),
        ));
      }),
    );
  }
}
