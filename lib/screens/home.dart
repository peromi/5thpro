import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:fifthproweb/data/api.dart';
import 'package:fifthproweb/mobile/contact_mobile.dart';
import 'package:fifthproweb/mobile/invest_mobile.dart';
import 'package:fifthproweb/mobile/joingroup_mobile.dart';
import 'package:fifthproweb/screens/contactus.dart';
import 'package:fifthproweb/screens/joingroup.dart';
import 'package:fifthproweb/screens/progressdialog.dart';
import 'package:fifthproweb/screens/share.dart';
import 'package:fifthproweb/screens/thankyou.dart';
import 'package:fifthproweb/utils/mycolors.dart';
import 'package:fifthproweb/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:url_launcher/url_launcher.dart';

import 'invest.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool featurecolor = false;
  bool teamcolor = false;
  bool contactcolor = false;
  bool getaccesscolor = false;
  bool newsletter = false;
  bool signup = false;
  bool scroltop = false;
  double _opacity = 0;

  bool net1 = false;
  bool net2 = false;
  bool net3 = false;
  bool net4 = false;
  bool net5 = false;

  bool home_mobile = false;
  bool feature_mobile = false;
  bool contact_mobile = false;

  double selectedmenu = 0;

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  int index = 0;
  ScrollController _controller = ScrollController();
  PageController _pageController = PageController(initialPage: 0);

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late Animation<double> animation;

  late Animation<Offset> _updown, _card1, _card2, _card3;
  late Animation<Offset> _fromRight;
  late Animation<Offset> _fromLeft;
  late Animation<Offset> _1st_left_component, _1st_right_component;
  late Animation<Offset> _2nd_left_component, _2nd_right_component;
  late Animation<Offset> _3rd_left_component, _3rd_right_component;
  late Animation<Offset> _4th_left_component, _4th_right_component;
  late Animation<Offset> _5th_left_component, _5th_right_component;
  late Animation<Offset> _6th_left_component, _6th_right_component;
  late Animation<Offset> _7th_left_component, _7th_right_component;
  late Animation<Offset> _8th_left_component, _8th_right_component;
  late Animation<Offset> _9th_left_component, _9th_right_component;
  late Animation<Offset> _10th_left_component, _10th_right_component;
  late Animation<Offset> _11th_left_component, _11th_right_component;

  late AnimationController animationController,
      rightcontroller,
      leftcontroller,
      _card1controller,
      _card2controller,
      _card3controller,
      _1st_left_controller,
      _2nd_left_controller,
      _3rd_left_controller,
      _4th_left_controller,
      _5th_left_controller,
      _6th_left_controller,
      _7th_left_controller,
      _8th_left_controller,
      _9th_left_controller,
      _10th_left_controller,
      _11th_left_controller,
      _1st_right_controller,
      _2nd_right_controller,
      _3rd_right_controller,
      _4th_right_controller,
      _5th_right_controller,
      _6th_right_controller,
      _7th_right_controller,
      _8th_right_controller,
      _9th_right_controller,
      _10th_right_controller,
      _11th_right_controller;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    rightcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    leftcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    //CARD ANIMATIONS
    _card1controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _card2controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _card3controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _1st_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _2nd_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _3rd_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _4th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _5th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _6th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _7th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _8th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _9th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _10th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _11th_left_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _1st_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _2nd_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _3rd_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _4th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _5th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _6th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _7th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _8th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _9th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _10th_right_controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _11th_right_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    //ANIMATION CONTROLLER ENDS

    super.initState();
    scroltop = false;
    _opacity = 1;

    _updown = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.08)).animate(
        CurvedAnimation(parent: leftcontroller, curve: Curves.easeInOut));
    _card1 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(
        CurvedAnimation(parent: leftcontroller, curve: Curves.easeInOut));
    _card2 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(
        CurvedAnimation(parent: leftcontroller, curve: Curves.easeInOut));
    _card3 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(
        CurvedAnimation(parent: leftcontroller, curve: Curves.easeInOut));
    //  ANIMATION COMPONENTS
    _1st_left_component = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _1st_left_controller, curve: Curves.easeIn));
    _2nd_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _2nd_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _3rd_left_component =
        Tween<Offset>(begin: Offset(-10, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _3rd_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _4th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _4th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _5th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _5th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _6th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _6th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _7th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _7th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _8th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _8th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _9th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _9th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _10th_left_component =
        Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _10th_left_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _11th_left_component =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _11th_left_controller, curve: Curves.easeIn));

    //RIGHT FLOW COMPONENTS
    _1st_right_component =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _1st_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _2nd_right_component =
        Tween<Offset>(begin: Offset(125, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _2nd_right_controller, curve: Curves.easeIn));
    _3rd_right_component =
        Tween<Offset>(begin: Offset(125, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _3rd_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _4th_right_component =
        Tween<Offset>(begin: Offset(125, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _4th_right_controller, curve: Curves.easeIn));
    _5th_right_component =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _5th_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _6th_right_component =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _6th_right_controller, curve: Curves.easeIn));
    _7th_right_component =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _7th_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _8th_right_component =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _8th_right_controller, curve: Curves.easeIn));
    _9th_right_component =
        Tween<Offset>(begin: Offset(0, 90), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _9th_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _10th_right_component =
        Tween<Offset>(begin: Offset(0, 90), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _10th_right_controller,
                curve: Curves.fastLinearToSlowEaseIn));
    _11th_right_component =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1)).animate(
            CurvedAnimation(
                parent: _11th_right_controller, curve: Curves.easeIn));

    _fromRight = Tween<Offset>(begin: Offset(0.0, 90), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: rightcontroller, curve: Curves.fastLinearToSlowEaseIn));

    _fromLeft = Tween<Offset>(begin: Offset(-1, 0.0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: leftcontroller, curve: Curves.easeIn));
    _fromRight.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rightcontroller.stop();
      } else if (status == AnimationStatus.dismissed) {
        rightcontroller.reset();
      }
    });

    _fromLeft.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        leftcontroller.stop();
      } else if (status == AnimationStatus.dismissed) {
        leftcontroller.reset();
      }
    });
    _updown.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        leftcontroller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        leftcontroller.forward();
      }
    });

//CARD ANIMATION REPEAT
    _card1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _card1controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _card1controller.forward();
      }
    });

    _card2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _card2controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _card2controller.forward();
      }
    });

    _card3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _card3controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _card3controller.forward();
      }
    });
//CARD ANIMATION REPEAT ENDS
    leftcontroller.forward();
    _1st_left_controller.forward();
    _1st_right_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
         small:_smallview(context),
        mobile: _mobileview(context),
        tablet: _mobileview(context),
        desktop: _desktopview(context));
  }

  Scaffold _smallview(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Small Screen"),
      ),
    );
  }
  Scaffold _tabletview(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tablet"),
      ),
    );
  }

  Scaffold _mobileview(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: deepblue,
        body: _listbodymobile(context));
  }

  NotificationListener _listbodymobile(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        print(_controller.position.pixels);
        setState(() {
          selectedmenu = _controller.position.pixels;
        });

        return true;
      },
      child: Scrollbar(
        controller: _controller,
        radius: Radius.circular(3),
        isAlwaysShown: true,
        child: ListView(
          controller: _controller,
          children: [
            Container(
              height: 1570,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background2.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 58, vertical: 25),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.25, color: lightblue))),
                    child: (selectedmenu > 0)
                        ? SizedBox.shrink()
                        : Container(
                            height: 100,
                            constraints: BoxConstraints(maxWidth: setwidth),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  width: 111.94,
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(7),
                                  color: darkgreen,
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) => Material(
                                                child: Container(
                                                    color: deepblue,
                                                    width: double.infinity,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        40,
                                                                    vertical:
                                                                        25),
                                                            decoration: BoxDecoration(
                                                                border: Border(
                                                                    bottom: BorderSide(
                                                                        width:
                                                                            1.25,
                                                                        color:
                                                                            lightblue))),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Image(
                                                                  image: AssetImage(
                                                                      "assets/images/logo.png"),
                                                                  width: 111.94,
                                                                ),
                                                                Material(
                                                                  color:
                                                                      lightblue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Icon(
                                                                          Icons
                                                                              .close_sharp,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 120,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Home'),
                                                            style: TextButton.styleFrom(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            12,
                                                                        vertical:
                                                                            8),
                                                                backgroundColor:
                                                                    deepblue,
                                                                primary: Colors
                                                                    .white,
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800)),
                                                          ),
                                                          SizedBox(
                                                            height: 116,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                'Features'),
                                                            style: TextButton.styleFrom(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            12,
                                                                        vertical:
                                                                            8),
                                                                backgroundColor:
                                                                    deepblue,
                                                                primary: Colors
                                                                    .white,
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800)),
                                                          ),
                                                          SizedBox(
                                                            height: 116,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          ContactMobile());
                                                            },
                                                            child: Text(
                                                                'Contact Us'),
                                                            style: TextButton.styleFrom(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            12,
                                                                        vertical:
                                                                            8),
                                                                backgroundColor:
                                                                    deepblue,
                                                                primary: Colors
                                                                    .white,
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800)),
                                                          ),
                                                          SizedBox(
                                                            height: 102,
                                                          ),
                                                          Container(
                                                            width: 330,
                                                            height: 75,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            InvestMobile());
                                                              },
                                                              child: Text(
                                                                  'Invest Now'),
                                                              style: TextButton.styleFrom(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              12,
                                                                          vertical:
                                                                              8),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14)),
                                                                  backgroundColor:
                                                                      darkgreen,
                                                                  primary:
                                                                      deepblue,
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          22.44,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 140,
                                                          ),
                                                          Text(
                                                            "SOCIAL",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 22.44,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 41.01,
                                                          ),
                                                          Container(
                                                            width: 340,
                                                            child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                    onHover:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        net1 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      await launch(
                                                                          'https://m.facebook.com/5thprofantasy/');
                                                                    },
                                                                    child: Image(
                                                                        color: (net1)
                                                                            ? darpink
                                                                            : darkgreen,
                                                                        image: AssetImage(
                                                                            "assets/images/${network[0]}"),
                                                                        width:
                                                                            45.35),
                                                                  ),
                                                                  InkWell(
                                                                    onHover:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        net2 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      await launch(
                                                                          'https://twitter.com/5thprofantasy?s=09');
                                                                    },
                                                                    child: Image(
                                                                        color: (net2)
                                                                            ? darpink
                                                                            : darkgreen,
                                                                        image: AssetImage(
                                                                            "assets/images/${network[1]}"),
                                                                        width:
                                                                            45.35),
                                                                  ),
                                                                  InkWell(
                                                                    onHover:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        net3 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      await launch(
                                                                          'https://instagram.com/5thprofantasy?igshid=1tqbfpnca4ez1');
                                                                    },
                                                                    child: Image(
                                                                        color: (net3)
                                                                            ? darpink
                                                                            : darkgreen,
                                                                        image: AssetImage(
                                                                            "assets/images/${network[2]}"),
                                                                        width:
                                                                            45.35),
                                                                  ),
                                                                  InkWell(
                                                                    onHover:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        net4 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      await launch(
                                                                          'https://www.linkedin.com/company/5thpro');
                                                                    },
                                                                    child: Image(
                                                                        color: (net4)
                                                                            ? darpink
                                                                            : darkgreen,
                                                                        image: AssetImage(
                                                                            "assets/images/${network[3]}"),
                                                                        width:
                                                                            45.35),
                                                                  ),
                                                                  InkWell(
                                                                    onHover:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        net5 =
                                                                            value;
                                                                      });
                                                                    },
                                                                    onTap:
                                                                        () {},
                                                                    child: Image(
                                                                        color: (net5)
                                                                            ? darpink
                                                                            : darkgreen,
                                                                        image: AssetImage(
                                                                            "assets/images/${network[4]}"),
                                                                        width:
                                                                            45.35),
                                                                  )
                                                                ]),
                                                          ),
                                                          SizedBox(
                                                            height: 25,
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              ));
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child:
                                          Image.asset("assets/images/menu.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  Expanded(
                    child: SlideTransition(
                      position: _1st_left_component,
                      child: Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: MediaQuery.of(context).size.width * 0.10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    "Fantasy Football with",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Real Life Rewards.",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: darkgreen,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 76,
                                  ),
                                  Container(
                                    child: Text(
                                      "5thpro is a tournament and trade\nplatform that offers unique digital\ncollectibles and cash prizes for\nfantasy football players 🤑",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 344.43,
                                    child: TextFormField(
                                      controller: emailController,
                                      style: TextStyle(
                                          fontSize: 12.49, color: darkgreen),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 25, horizontal: 30),
                                          hintText: "Enter your e-mail address",
                                          hintStyle: TextStyle(
                                              fontSize: 12.49,
                                              color: lightblue),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: darkgreen)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  9.36663),
                                              borderSide:
                                                  BorderSide(width: 1.2, color: lightblue))),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  // Container(
                                  //     width: 190,
                                  //     height: 49,
                                  //     alignment: Alignment.centerLeft,
                                  //     decoration: BoxDecoration(
                                  //         border: Border.all(
                                  //             width: 1.2,
                                  //             color: lightblue),
                                  //         borderRadius:
                                  //             BorderRadius.circular(
                                  //                 9.36663)),
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //             width: 49,
                                  //             alignment: Alignment.center,
                                  //             decoration: BoxDecoration(
                                  //               border: Border(
                                  //                   right: BorderSide(
                                  //                       width: 1.2,
                                  //                       color:
                                  //                           lightblue)),
                                  //             ),
                                  //             child: CountryCodePicker(
                                  //               initialSelection: 'NG',
                                  //               favorite: ['+234','NG'],
                                  //               // optional. Shows only country name and flag
                                  //               showCountryOnly: false,
                                  //               // optional. Shows only country name and flag when popup is closed.
                                  //               showOnlyCountryWhenClosed: false,
                                  //               // optional. aligns the flag and the Text left
                                  //               alignLeft: false,
                                  //             )
                                  //         ),
                                  //         SizedBox(
                                  //           width: 13,
                                  //         ),
                                  //         Expanded(
                                  //           child: TextFormField(
                                  //             controller: mobileController,
                                  //             decoration: InputDecoration
                                  //                 .collapsed(
                                  //               hintText:
                                  //                   "Your number too",
                                  //               hintStyle: TextStyle(
                                  //                   fontSize: 12.49,
                                  //                   color: lightblue),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     )),
                                  Container(
                                    width: 344.43,
                                    child: TextFormField(
                                      controller: mobileController,
                                      style: TextStyle(
                                          fontSize: 12.49, color: darkgreen),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 25, horizontal: 30),
                                          hintText: "Enter your number",
                                          hintStyle: TextStyle(
                                              fontSize: 12.49,
                                              color: lightblue),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: darkgreen)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.36663),
                                              borderSide: BorderSide(width: 1.2, color: lightblue))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    '''reserve your spot today and claim free tickets!''',
                                    style: TextStyle(
                                        color: darkgreen,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Container(
                                      width: 344.43,
                                      height: 75,
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          if (emailController.text.isEmpty ||
                                              mobileController.text.isEmpty) {
                                            return;
                                          }
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ProgressDialog(
                                                      message:
                                                          "Please wait..."));
                                          var data = {
                                            "email": emailController.text,
                                            "mobile": mobileController.text,
                                          };
                                          var res = await CallApi()
                                              .postData(data, "subscribe");
                                          var body = json.decode(res.body);
                                          print(body);
                                          emailController.clear();
                                          mobileController.clear();
                                          FocusScope.of(context).nextFocus();
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  JoinGroupMobile());
                                        },
                                        child: Text(
                                          "Get Early Access",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            backgroundColor: darkgreen,
                                            primary: deepblue),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 128),
                              child: SlideTransition(
                                position: _1st_right_component,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SlideTransition(
                                      position: _updown,
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/player.png"),
                                        width: 471,
                                        height: 542,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // SECOND COMPONENT LAYOUT
            Container(
              width: double.infinity,
              color: deepblue,
              alignment: Alignment.topCenter,
              child: Container(
                child: ClipPath(
                  clipper: LevelTwo2Clip(),
                  child: Container(
                    width: double.infinity,
                    height: 900,
                    color: darkblue,
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 94.3),
                      clipBehavior: Clip.antiAlias,
                      width: 486,
                      height: 656,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [lightblue, darkgreen],
                              stops: [0.1, 3.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/yellow.png"),
                                  alignment: Alignment.topLeft)),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 414.79,
                              height: 276.52,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/prizes.png"),
                                      alignment: Alignment.bottomRight)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 34, left: 43.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Play in the\nBiggest\nTournaments\nand get\nRewards!',
                                style: TextStyle(
                                    fontSize: 43,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                  width: 240,
                                  height: 75,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Get Early Access",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        backgroundColor: darkblue,
                                        primary: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            // THIRD COMPONENT LAYOUT
            Container(
              height: 1400,
              color: deepblue,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 86.4,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 74.49,
                              height: 148.11,
                              margin: EdgeInsets.only(top: 322.62),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/vecleft.png"),
                                      alignment: Alignment.centerRight,
                                      fit: BoxFit.fitHeight)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 50.0),
                                  child: Text("How to play",
                                      style: TextStyle(
                                          fontFamily: 'Mont',
                                          fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800)),
                                ),
                                SizedBox(
                                  height: 18.73,
                                ),
                                Material(
                                  color: darkblue,
                                  borderRadius: BorderRadius.circular(13.11),
                                  child: Container(
                                    width: 349.53,
                                    height: 111.85,
                                    padding: EdgeInsets.only(left: 22),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/football.png",
                                          width: 60.29,
                                          height: 61.17,
                                        ),
                                        SizedBox(
                                          width: 17.48,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "Choose ",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white)),
                                          TextSpan(
                                              text:
                                                  "free or paid\ntournaments and\ncompete 😍",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white))
                                        ]))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35.5,
                                ),
                                Material(
                                  color: darkblue,
                                  borderRadius: BorderRadius.circular(13.11),
                                  child: Container(
                                    width: 349.53,
                                    height: 111.85,
                                    padding: EdgeInsets.only(left: 22),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/shirt_icon.png",
                                          width: 60.29,
                                          height: 61.17,
                                        ),
                                        SizedBox(
                                          width: 17.48,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "Pick ",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white)),
                                          TextSpan(
                                              text:
                                                  "your players from\nthe biggest league to\nmake up your Team 😎",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white))
                                        ]))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 34.95,
                                ),
                                Material(
                                  color: darkblue,
                                  borderRadius: BorderRadius.circular(13.11),
                                  child: Container(
                                    width: 349.53,
                                    height: 111.85,
                                    padding: EdgeInsets.only(left: 22),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/Trophy.png",
                                          width: 60.29,
                                          height: 61.17,
                                        ),
                                        SizedBox(
                                          width: 17.48,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "Watch ",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white)),
                                          TextSpan(
                                              text:
                                                  "your team\nscore in real time and\nwin real rewards 🤑",
                                              style: TextStyle(
                                                  fontSize: 19.22,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white))
                                        ]))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 65.09,
                              height: 148.11,
                              margin: EdgeInsets.only(top: 168),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/vecright.png"),
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.fitHeight)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 114.34),
                      child: ParallaxStack(resetOnExit: true, layers: [
                        ParallaxLayer(
                          zRotation: -0.4,
                          xOffset: 80,
                          xRotation: 0.35,
                          yRotation: -0.5,
                          enable3D: true,
                          center: true,
                          child: SlideTransition(
                            position: _updown,
                            child: Image(
                              image: AssetImage("assets/images/phone2.png"),
                              width: 486.58,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            //FOURTH COMPONENT LAYOUT
            Container(
              color: deepblue,
              child: Container(
                child: ClipPath(
                  clipper: LevelThree3Clip(),
                  child: Container(
                    height: 405,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [darkgreen, lightblue])),
                    child: Center(
                      child: Container(
                        child: Text(
                          "This is how we are\nchanging the game.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //FIVETH COMPONENT LAYOUT
            Container(
              color: darkblue,
              height: 1013,
              width: double.infinity,
              child: Container(
                constraints: BoxConstraints(maxWidth: setwidth),
                child: ClipPath(
                  clipper: LevelFour4Clip(),
                  child: Container(
                    color: deepblue,
                    child: Container(
                      height: 1080,
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 84,
                          ),
                          Text("New Player Scoring & NFTs 😱",
                              style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: 34,
                          ),
                          Container(
                            width: 526,
                            child: Text(
                              'Experience Fantasy Premier League like never\nbefore with new player scoring, NFTs, digital tokens\n& more...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 73,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/boot.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.09,
                                          ),
                                          Text("Tackles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.88,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/passes.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.09,
                                          ),
                                          Text("Passes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 23.6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/crosses.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.87,
                                          ),
                                          Text("Crosses",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.88,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.only(left: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/longrange_goal.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.09,
                                          ),
                                          Text("Long-range\ngoal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 23.6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.only(left: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/dribbles.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.09,
                                          ),
                                          Text("Dribbles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.88,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(13.48),
                                    child: Container(
                                      width: 230.06,
                                      height: 107.84,
                                      padding: EdgeInsets.only(left: 20.67),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/substitute_goal.png",
                                            width: 62.01,
                                            height: 62.91,
                                          ),
                                          SizedBox(
                                            width: 8.09,
                                          ),
                                          Text("Substitute\ngoal",
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Material(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(13.48),
                                child: Container(
                                  width: 230.06,
                                  height: 107.84,
                                  padding: EdgeInsets.only(left: 20.67),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/digital_collectables.png",
                                        width: 62.01,
                                        height: 62.91,
                                      ),
                                      SizedBox(
                                        width: 8.09,
                                      ),
                                      Text("Digital\ncollectables",
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //SIXTH COMPONENT LAYOUT
            Container(
              height: 1403,
              color: darkblue,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                width: 600,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 104,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Create ",
                          style: TextStyle(
                              fontFamily: 'Mont',
                              fontSize: 38.94,
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: "Custom Leagues",
                          style: TextStyle(
                              fontFamily: 'Mont',
                              fontSize: 38.94,
                              color: darkgreen,
                              fontWeight: FontWeight.w800))
                    ])),
                    SizedBox(height: 45),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 18.73,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 66.46,
                                    height: 151.23,
                                    margin: EdgeInsets.only(top: 149.62),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/vecleft.png"),
                                            alignment: Alignment.centerRight)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Material(
                                        color: darkedblue,
                                        borderRadius:
                                            BorderRadius.circular(13.38),
                                        child: Container(
                                          width: 356.9,
                                          height: 114.21,
                                          padding: EdgeInsets.only(left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/create_icon.png",
                                                width: 61.56,
                                                height: 62.46,
                                              ),
                                              SizedBox(
                                                width: 17.5,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Create ",
                                                    style: TextStyle(
                                                        fontSize: 17.84,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "customized\nleagues with unique\nknockout structures 😀",
                                                    style: TextStyle(
                                                        fontSize: 17.84,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35.69,
                                      ),
                                      Material(
                                        color: darkedblue,
                                        borderRadius:
                                            BorderRadius.circular(13.38),
                                        child: Container(
                                          width: 356.9,
                                          height: 114.21,
                                          padding: EdgeInsets.only(left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/add_icon.png",
                                                width: 61.56,
                                                height: 62.46,
                                              ),
                                              SizedBox(
                                                width: 17.5,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Add ",
                                                    style: TextStyle(
                                                        fontSize: 17.84,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "or remove teams\nas an admin 🕹",
                                                    style: TextStyle(
                                                        fontSize: 17.84,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35.69,
                                      ),
                                      Material(
                                        color: darkedblue,
                                        borderRadius:
                                            BorderRadius.circular(13.38),
                                        child: Container(
                                          width: 356.9,
                                          height: 114.21,
                                          padding: EdgeInsets.only(left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/chat.png",
                                                width: 61.56,
                                                height: 62.46,
                                              ),
                                              SizedBox(
                                                width: 17.5,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Chat ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "with players in\nyour league 😮",
                                                    style: TextStyle(
                                                        fontSize: 17.84,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 66.46,
                                    // height: 151.23,
                                    height: 330,
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/vecright.png"),
                                            alignment: Alignment.topLeft)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 99),
                          child: ParallaxStack(resetOnExit: true, layers: [
                            ParallaxLayer(
                              zRotation: -0.4,
                              xOffset: 80,
                              xRotation: 0.35,
                              yRotation: -0.5,
                              enable3D: true,
                              center: true,
                              child: SlideTransition(
                                position: _updown,
                                child: Image(
                                  image: AssetImage("assets/images/phone4.png"),
                                  width: 390.62,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //SEVENTH COMPONENT LAYOUT

            Container(
              width: double.infinity,
              height: 480.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [lightblue, darkgreen])),
              child: Container(
                constraints: BoxConstraints(maxWidth: setwidth),
                child: Center(
                  child: Container(
                    width: 465,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Join us as we make\nFantasy Football more\nRewarding for the\nPlayers.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 34.48,
                        ),
                        Center(
                          child: InkWell(
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  signup = value;
                                });
                              } else {
                                setState(() {
                                  signup = value;
                                });
                              }
                            },
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => InvestMobile());
                            },
                            child: Container(
                              width: 344.43,
                              height: 75,
                              decoration: BoxDecoration(
                                  color: (signup) ? Colors.white : deepblue,
                                  borderRadius: BorderRadius.circular(9)),
                              child: Center(
                                child: Text(
                                  "Invest now",
                                  style: TextStyle(
                                      color: (signup) ? deepblue : Colors.white,
                                      fontSize: 14.99,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //ELEVENTH COMPONENT LAYOUT
            Container(
              width: double.infinity,
              height: 910,
              alignment: Alignment.center,
              color: deepblue,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: 502,
                  height: 623,
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      gradient: LinearGradient(colors: [lightblue, darkgreen])),
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Be the first to",
                            style: TextStyle(
                                fontSize: 44.96,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Text(
                            "download the app",
                            style: TextStyle(
                                fontSize: 44.96,
                                fontWeight: FontWeight.w800,
                                color: darkgreen),
                          ),
                          SizedBox(
                            height: 21.86,
                          ),
                          Text(
                            "Join the waiting list for early\naccess and product updates.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.48,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 51.2,
                          ),
                          Container(
                            width: 344.43,
                            child: TextFormField(
                              controller: emailController,
                              style:
                                  TextStyle(fontSize: 12.49, color: darkgreen),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 30),
                                  hintText: "Enter your e-mail address",
                                  hintStyle: TextStyle(
                                      fontSize: 12.49, color: lightblue),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: darkgreen)),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue))),
                            ),
                          ),
                          SizedBox(height: 15),
                          // Container(
                          //     width: 190,
                          //     height: 49,
                          //     alignment: Alignment.centerLeft,
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1.2,
                          //             color: lightblue),
                          //         borderRadius:
                          //             BorderRadius.circular(
                          //                 9.36663)),
                          //     child: Row(
                          //       children: [
                          //         Container(
                          //             width: 49,
                          //             alignment: Alignment.center,
                          //             decoration: BoxDecoration(
                          //               border: Border(
                          //                   right: BorderSide(
                          //                       width: 1.2,
                          //                       color:
                          //                           lightblue)),
                          //             ),
                          //             child: CountryCodePicker(
                          //               initialSelection: 'NG',
                          //               favorite: ['+234','NG'],
                          //               // optional. Shows only country name and flag
                          //               showCountryOnly: false,
                          //               // optional. Shows only country name and flag when popup is closed.
                          //               showOnlyCountryWhenClosed: false,
                          //               // optional. aligns the flag and the Text left
                          //               alignLeft: false,
                          //             )
                          //         ),
                          //         SizedBox(
                          //           width: 13,
                          //         ),
                          //         Expanded(
                          //           child: TextFormField(
                          //             controller: mobileController,
                          //             decoration: InputDecoration
                          //                 .collapsed(
                          //               hintText:
                          //                   "Your number too",
                          //               hintStyle: TextStyle(
                          //                   fontSize: 12.49,
                          //                   color: lightblue),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     )),
                          Container(
                            width: 344.43,
                            child: TextFormField(
                              controller: mobileController,
                              style:
                                  TextStyle(fontSize: 12.49, color: darkgreen),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 30),
                                  hintText: "Enter your number",
                                  hintStyle: TextStyle(
                                      fontSize: 12.49, color: lightblue),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: darkgreen)),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(9.36663),
                                      borderSide: BorderSide(
                                          width: 1.2, color: lightblue))),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),

                          SizedBox(
                            height: 24,
                          ),
                          Container(
                              width: 344.43,
                              height: 75,
                              child: OutlinedButton(
                                onPressed: () async {
                                  if (emailController.text.isEmpty ||
                                      mobileController.text.isEmpty) {
                                    return;
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (context) => ProgressDialog(
                                          message: "Please wait..."));
                                  var data = {
                                    "email": emailController.text,
                                    "mobile": mobileController.text,
                                  };
                                  var res = await CallApi()
                                      .postData(data, "subscribe");
                                  var body = json.decode(res.body);
                                  print(body);
                                  emailController.clear();
                                  mobileController.clear();
                                  FocusScope.of(context).nextFocus();
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) => JoinGroupMobile());
                                },
                                child: Text(
                                  "Get Early Access",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: darkgreen,
                                    primary: deepblue),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //TWELVETH COMPONENT LAYOUT
            Container(
              constraints: BoxConstraints(maxWidth: setwidth),
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 165,
                decoration: BoxDecoration(
                    color: deepblue,
                    border: Border(
                        top: BorderSide(width: 1.25, color: lightblue),
                        bottom: BorderSide(width: 1.25, color: lightblue))),
                child: Container(
                  height: 80,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.9,
                            child: Image(
                              image: AssetImage("assets/images/applestore.png"),
                              width: 150,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Image(
                              image: AssetImage("assets/images/goggleplay.png"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        color: deepblue.withOpacity(0.86),
                        child: Center(
                          child: Text(
                            "Coming soon!!!".toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 310.87,
              color: deepblue,
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 129,
                      ),
                      SizedBox(
                        height: 32.19,
                      ),
                      Container(
                        width: 340,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net1 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://m.facebook.com/5thprofantasy/');
                                },
                                child: Image(
                                    color: (net1) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[0]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net2 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://twitter.com/5thprofantasy?s=09');
                                },
                                child: Image(
                                    color: (net2) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[1]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net3 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://instagram.com/5thprofantasy?igshid=1tqbfpnca4ez1');
                                },
                                child: Image(
                                    color: (net3) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[2]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net4 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://www.linkedin.com/company/5thpro');
                                },
                                child: Image(
                                    color: (net4) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[3]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net5 = value;
                                  });
                                },
                                onTap: () {},
                                child: Image(
                                    color: (net5) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[4]}"),
                                    width: 45.35),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        "Copyright 2021 RedGeniux - All rights reserved.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: darkgreen),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold _desktopview(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: deepblue,
      appBar: (selectedmenu > 0)
          ? AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Center(
                child: Container(
                  height: 90,
                  constraints: BoxConstraints(maxWidth: setwidth),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.animateTo(0,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut);
                          setState(() {
                            selectedmenu = 0;
                          });
                        },
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                          width: 80,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onHover: (value) {
                                if (value == true) {
                                  setState(() {
                                    featurecolor = value;
                                  });
                                } else {
                                  setState(() {
                                    featurecolor = value;
                                  });
                                }
                              },
                              onTap: () {
                                _controller.animateTo(947,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                                setState(() {
                                  selectedmenu = 947;
                                });
                              },
                              child:
                                  (selectedmenu >= 946 && selectedmenu <= 5710)
                                      ? Text(
                                          "Home",
                                          style: TextStyle(
                                              color: darkgreen,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : Text(
                                          "Home",
                                          style: TextStyle(
                                              color: (featurecolor)
                                                  ? darkgreen
                                                  : Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                              onHover: (value) {
                                if (value == true) {
                                  setState(() {
                                    teamcolor = value;
                                  });
                                } else {
                                  setState(() {
                                    teamcolor = value;
                                  });
                                }
                              },
                              onTap: () {
                                _controller.animateTo(5712,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                                setState(() {
                                  selectedmenu = 5711;
                                });
                              },
                              child:
                                  (selectedmenu > 5711 && selectedmenu < 6784)
                                      ? Text("Features",
                                          style: TextStyle(
                                              color: darkgreen,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600))
                                      : Text("Features",
                                          style: TextStyle(
                                              color: (teamcolor)
                                                  ? darkgreen
                                                  : Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600))),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                              onHover: (value) {
                                if (value == true) {
                                  setState(() {
                                    contactcolor = value;
                                  });
                                } else {
                                  setState(() {
                                    contactcolor = value;
                                  });
                                }
                              },
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ContactUs());
                              },
                              child: Text("Contact Us",
                                  style: TextStyle(
                                      color: (contactcolor)
                                          ? darkgreen
                                          : Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  getaccesscolor = value;
                                });
                              } else {
                                setState(() {
                                  getaccesscolor = value;
                                });
                              }
                            },
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Invest());
                            },
                            child: Container(
                              width: 123.68,
                              height: 44.96,
                              decoration: BoxDecoration(
                                  color: (getaccesscolor)
                                      ? Colors.white
                                      : darkgreen,
                                  borderRadius: BorderRadius.circular(9.37)),
                              child: Center(
                                  child: Text("Invest Now",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: 14.99,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600))),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.pink),
          child: _listbody(context)),
    );
  }

  NotificationListener _listbody(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        print(_controller.position.pixels);
        setState(() {
          selectedmenu = _controller.position.pixels;
        });

        return true;
      },
      child: Scrollbar(
        controller: _controller,
        radius: Radius.circular(3),
        isAlwaysShown: true,
        child: ListView(
          controller: _controller,
          children: [
            Container(
              height: 782.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.25, color: lightblue))),
                    child: (selectedmenu > 0)
                        ? SizedBox.shrink()
                        : Container(
                            height: 104.91,
                            constraints: BoxConstraints(maxWidth: setwidth),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  width: 129.19,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onHover: (value) {
                                          if (value == true) {
                                            setState(() {
                                              featurecolor = value;
                                            });
                                          } else {
                                            setState(() {
                                              featurecolor = value;
                                            });
                                          }
                                        },
                                        onTap: () {
                                          _controller.animateTo(0,
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeInOut);
                                          setState(() {
                                            selectedmenu = 947;
                                          });
                                        },
                                        child: (selectedmenu == 947)
                                            ? Text(
                                                "Home",
                                                style: TextStyle(
                                                    color: darkgreen,
                                                    fontSize: 14.99,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            : Text(
                                                "Home",
                                                style: TextStyle(
                                                    color: (featurecolor)
                                                        ? darkgreen
                                                        : Colors.white,
                                                    fontSize: 14.99,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                    SizedBox(
                                      width: 30.22,
                                    ),
                                    InkWell(
                                        onHover: (value) {
                                          if (value == true) {
                                            setState(() {
                                              teamcolor = value;
                                            });
                                          } else {
                                            setState(() {
                                              teamcolor = value;
                                            });
                                          }
                                        },
                                        onTap: () {
                                          _controller.animateTo(5447,
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeInOut);
                                          setState(() {
                                            selectedmenu = 5447;
                                          });
                                        },
                                        child: (selectedmenu == 5446)
                                            ? Text("Features",
                                                style: TextStyle(
                                                    color: darkgreen,
                                                    fontSize: 14.99,
                                                    fontWeight:
                                                        FontWeight.w600))
                                            : Text("Features",
                                                style: TextStyle(
                                                    color: (teamcolor)
                                                        ? darkgreen
                                                        : Colors.white,
                                                    fontSize: 14.99,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                    SizedBox(
                                      width: 32.19,
                                    ),
                                    InkWell(
                                        onHover: (value) {
                                          if (value == true) {
                                            setState(() {
                                              contactcolor = value;
                                            });
                                          } else {
                                            setState(() {
                                              contactcolor = value;
                                            });
                                          }
                                        },
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ContactUs());
                                        },
                                        child: Text("Contact Us",
                                            style: TextStyle(
                                                color: (contactcolor)
                                                    ? darkgreen
                                                    : Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600))),
                                    SizedBox(
                                      width: 30.25,
                                    ),
                                    InkWell(
                                      onHover: (value) {
                                        if (value == true) {
                                          setState(() {
                                            getaccesscolor = value;
                                          });
                                        } else {
                                          setState(() {
                                            getaccesscolor = value;
                                          });
                                        }
                                      },
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Invest());
                                      },
                                      child: Container(
                                        width: 123.68,
                                        height: 44.96,
                                        decoration: BoxDecoration(
                                            color: (getaccesscolor)
                                                ? Colors.white
                                                : darkgreen,
                                            borderRadius:
                                                BorderRadius.circular(9.37)),
                                        child: Center(
                                            child: Text("Invest Now",
                                                style: TextStyle(
                                                    color: darkblue,
                                                    fontSize: 14.99,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                  ),
                  Expanded(
                    child: SlideTransition(
                      position: _1st_left_component,
                      child: Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: MediaQuery.of(context).size.width * 0.10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 550,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Fantasy Football with",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "Real Life Rewards.",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: darkgreen,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 550,
                                    child: Text(
                                      "5thpro is a tournament and trade platform that\noffers unique digital collectibles and cash prizes\nfor fantasy football players 🤑",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 550,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 190,
                                            height: 50,
                                            child: TextFormField(
                                              controller: emailController,
                                              style: TextStyle(
                                                  fontSize: 12.49,
                                                  color: darkgreen),
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Enter your e-mail address",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12.49,
                                                      color: lightblue),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: lightblue)),
                                                  disabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: lightblue)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: darkgreen)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(width: 1.2, color: lightblue))),
                                            )),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        // Container(
                                        //     width: 190,
                                        //     height: 49,
                                        //     alignment: Alignment.centerLeft,
                                        //     decoration: BoxDecoration(
                                        //         border: Border.all(
                                        //             width: 1.2,
                                        //             color: lightblue),
                                        //         borderRadius:
                                        //             BorderRadius.circular(
                                        //                 9.36663)),
                                        //     child: Row(
                                        //       children: [
                                        //         Container(
                                        //             width: 49,
                                        //             alignment: Alignment.center,
                                        //             decoration: BoxDecoration(
                                        //               border: Border(
                                        //                   right: BorderSide(
                                        //                       width: 1.2,
                                        //                       color:
                                        //                           lightblue)),
                                        //             ),
                                        //             child: CountryCodePicker(
                                        //               initialSelection: 'NG',
                                        //               favorite: ['+234','NG'],
                                        //               // optional. Shows only country name and flag
                                        //               showCountryOnly: false,
                                        //               // optional. Shows only country name and flag when popup is closed.
                                        //               showOnlyCountryWhenClosed: false,
                                        //               // optional. aligns the flag and the Text left
                                        //               alignLeft: false,
                                        //             )
                                        //         ),
                                        //         SizedBox(
                                        //           width: 13,
                                        //         ),
                                        //         Expanded(
                                        //           child: TextFormField(
                                        //             controller: mobileController,
                                        //             decoration: InputDecoration
                                        //                 .collapsed(
                                        //               hintText:
                                        //                   "Your number too",
                                        //               hintStyle: TextStyle(
                                        //                   fontSize: 12.49,
                                        //                   color: lightblue),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     )),
                                        Container(
                                            width: 190,
                                            height: 50,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  fontSize: 12.49,
                                                  color: darkgreen),
                                              controller: mobileController,
                                              decoration: InputDecoration(
                                                  hintText: "Enter your number",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12.49,
                                                      color: lightblue),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: lightblue)),
                                                  disabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: lightblue)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(
                                                          width: 1.2,
                                                          color: darkgreen)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.36663),
                                                      borderSide: BorderSide(width: 1.2, color: lightblue))),
                                            )),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                            width: 152,
                                            height: 50,
                                            child: OutlinedButton(
                                              onPressed: () async {
                                                if (emailController
                                                        .text.isEmpty ||
                                                    mobileController
                                                        .text.isEmpty) {
                                                  return;
                                                }
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        ProgressDialog(
                                                            message:
                                                                "Please wait..."));
                                                var data = {
                                                  "email": emailController.text,
                                                  "mobile":
                                                      mobileController.text,
                                                };
                                                var res = await CallApi()
                                                    .postData(
                                                        data, "subscribe");
                                                var body =
                                                    json.decode(res.body);
                                                print(body);
                                                emailController.clear();
                                                mobileController.clear();
                                                FocusScope.of(context)
                                                    .nextFocus();
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        JoinGroup());
                                              },
                                              child: Text(
                                                "Get Early Access",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.3)),
                                                  backgroundColor: darkgreen,
                                                  primary: deepblue),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''reserve your spot today and claim free tickets!''',
                                    style: TextStyle(
                                        color: darkgreen,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 45,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            SlideTransition(
                              position: _1st_right_component,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SlideTransition(
                                    position: _updown,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/player.png"),
                                      width: 471,
                                      height: 542,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // SECOND COMPONENT LAYOUT
            Container(
              width: double.infinity,
              color: deepblue,
              alignment: Alignment.topCenter,
              child: Container(
                child: ClipPath(
                  clipper: LevelTwoClip(),
                  child: Container(
                    width: double.infinity,
                    height: 858,
                    color: darkblue,
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 140.3),
                      clipBehavior: Clip.antiAlias,
                      width: 997,
                      height: 494,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [lightblue, darkgreen],
                              stops: [0.5, 1.0],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/yellow.png"),
                                  alignment: Alignment.topLeft)),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 600,
                              height: 600,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/prizes.png"),
                                      alignment: Alignment.bottomRight)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 61.0, left: 51.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Play in the Biggest\nTournaments\nand get Rewards!',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 20.97,
                              ),
                              Container(
                                  width: 152,
                                  height: 50,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => ShareLinks());
                                    },
                                    child: Text(
                                      "Get Early Access",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.3)),
                                        backgroundColor: darkblue,
                                        primary: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            // THIRD COMPONENT LAYOUT
            Container(
              height: 858.5,
              color: deepblue,
              child: Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 858.5,
                  color: deepblue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ParallaxStack(resetOnExit: true, layers: [
                        ParallaxLayer(
                          zRotation: -0.4,
                          xOffset: 80,
                          xRotation: 0.35,
                          yRotation: -0.5,
                          enable3D: true,
                          center: true,
                          child: SlideTransition(
                            position: _updown,
                            child: Image(
                              image: AssetImage("assets/images/phone2.png"),
                              width: 390.62,
                            ),
                          ),
                        )
                      ]),
                      Container(
                        width: 573,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 106.4,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 74.0),
                              child: Text("How to play",
                                  style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800)),
                            ),
                            SizedBox(
                              height: 18.73,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 74.49,
                                  height: 143.38,
                                  margin: EdgeInsets.only(top: 232.62),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/vecleft.png"),
                                          alignment: Alignment.centerRight)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: darkblue,
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 400,
                                        height: 128,
                                        padding: EdgeInsets.only(
                                            top: 18.62, left: 22),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                "assets/images/football.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Choose ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white)),
                                              TextSpan(
                                                  text:
                                                      "free or paid\ntournaments and\ncompete 😍",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white))
                                            ]))
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.62,
                                    ),
                                    Material(
                                      color: darkblue,
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 400,
                                        height: 128,
                                        padding: EdgeInsets.only(
                                            top: 18.62, left: 22),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                "assets/images/shirt_icon.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Pick ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white)),
                                              TextSpan(
                                                  text:
                                                      "your players from\nthe biggest league to\nmake up your Team 😎",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white))
                                            ]))
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.62,
                                    ),
                                    Material(
                                      color: darkblue,
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 400,
                                        height: 128,
                                        padding: EdgeInsets.only(
                                            top: 18.62, left: 22),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                "assets/images/Trophy.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Watch ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white)),
                                              TextSpan(
                                                  text:
                                                      "your team\nscore in real time and\nwin real rewards 🤑",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white))
                                            ]))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 74.49,
                                  height: 143.38,
                                  margin: EdgeInsets.only(top: 64),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/vecright.png"),
                                          alignment: Alignment.centerLeft)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //FOURTH COMPONENT LAYOUT
            Container(
              color: deepblue,
              child: Container(
                child: ClipPath(
                  clipper: LevelThreeClip(),
                  child: Container(
                    height: 463,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [darkgreen, lightblue])),
                    child: Center(
                      child: Container(
                        width: 619,
                        child: Text(
                          "This is how we are changing\nthe game.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //FIVETH COMPONENT LAYOUT
            Container(
              color: darkblue,
              height: 1080,
              width: double.infinity,
              child: Container(
                constraints: BoxConstraints(maxWidth: setwidth),
                child: ClipPath(
                  clipper: LevelFourClip(),
                  child: Container(
                    color: deepblue,
                    child: Container(
                      height: 1080,
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Text("New Player Scoring & NFTs 😱",
                              style: TextStyle(
                                  fontFamily: 'Mont',
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: 34,
                          ),
                          Container(
                            width: 526,
                            child: Text(
                              'Experience Fantasy Premier League like never before with new player scoring, NFTs, digital tokens & more...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 73,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/boot.png"),
                                          SizedBox(
                                            width: 8.85,
                                          ),
                                          Text("Tackles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 39.34,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/passes.png"),
                                          SizedBox(
                                            width: 8.87,
                                          ),
                                          Text("Passes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 39.34,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/crosses.png"),
                                          SizedBox(
                                            width: 8.87,
                                          ),
                                          Text("Crosses",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 23.6,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/longrange_goal.png"),
                                          SizedBox(
                                            width: 8.85,
                                          ),
                                          Text("Long-range\ngoal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 39.34,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.only(left: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/dribbles.png"),
                                          SizedBox(
                                            width: 8.85,
                                          ),
                                          Text("Dribbles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 39.34,
                                  ),
                                  Material(
                                    color: darkblue,
                                    borderRadius: BorderRadius.circular(14.75),
                                    child: Container(
                                      width: 251.77,
                                      height: 118.02,
                                      padding: EdgeInsets.only(left: 22.62),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/substitute_goal.png"),
                                          SizedBox(
                                            width: 8.85,
                                          ),
                                          Text("Substitute\ngoal",
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 23.6,
                              ),
                              Material(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(14.75),
                                child: Container(
                                  width: 251.77,
                                  height: 118.02,
                                  padding: EdgeInsets.only(left: 22.62),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/digital_collectables.png"),
                                      SizedBox(
                                        width: 8.85,
                                      ),
                                      Text("Digital\ncollectables",
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //SIXTH COMPONENT LAYOUT
            Container(
              height: 927,
              color: darkblue,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: 106,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Create ",
                          style: TextStyle(
                              fontFamily: 'Mont',
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: "Custom Leagues",
                          style: TextStyle(
                              fontFamily: 'Mont',
                              fontSize: 45,
                              color: darkgreen,
                              fontWeight: FontWeight.w800))
                    ])),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ParallaxStack(resetOnExit: true, layers: [
                          ParallaxLayer(
                            zRotation: -0.4,
                            xOffset: 80,
                            xRotation: 0.35,
                            yRotation: -0.5,
                            enable3D: true,
                            center: true,
                            child: SlideTransition(
                              position: _updown,
                              child: Image(
                                image: AssetImage("assets/images/phone4.png"),
                                width: 390.62,
                              ),
                            ),
                          )
                        ]),
                        Container(
                          width: 573,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.73,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 74.49,
                                    height: 143.38,
                                    margin: EdgeInsets.only(top: 232.62),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/vecleft.png"),
                                            alignment: Alignment.centerRight)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Material(
                                        color: darkedblue,
                                        borderRadius: BorderRadius.circular(15),
                                        child: Container(
                                          width: 400,
                                          height: 128,
                                          padding: EdgeInsets.only(
                                              top: 18.62, left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/create_icon.png"),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Create ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "customized\nleagues with unique\nknockout structures 😀",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.62,
                                      ),
                                      Material(
                                        color: darkedblue,
                                        borderRadius: BorderRadius.circular(15),
                                        child: Container(
                                          width: 400,
                                          height: 128,
                                          padding: EdgeInsets.only(
                                              top: 18.62, left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/add_icon.png"),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Add ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "or remove teams\nas an admin 🕹",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.62,
                                      ),
                                      Material(
                                        color: darkedblue,
                                        borderRadius: BorderRadius.circular(15),
                                        child: Container(
                                          width: 400,
                                          height: 128,
                                          padding: EdgeInsets.only(
                                              top: 18.62, left: 22),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/chat.png"),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Chat ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white)),
                                                TextSpan(
                                                    text:
                                                        "with players in\nyour league 😮",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 74.49,
                                    height: 143.38,
                                    margin: EdgeInsets.only(top: 64),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/vecright.png"),
                                            alignment: Alignment.centerLeft)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //SEVENTH COMPONENT LAYOUT

            Container(
              width: double.infinity,
              height: 344,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [lightblue, darkgreen])),
              child: Container(
                constraints: BoxConstraints(maxWidth: setwidth),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 221,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/player2.png'),
                                alignment: Alignment.centerRight)),
                      ),
                      Container(
                        width: 800,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Join us as we make Fantasy Football\nmore Rewarding for the Players.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40.88,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 34.48,
                            ),
                            Center(
                              child: InkWell(
                                onHover: (value) {
                                  if (value == true) {
                                    setState(() {
                                      signup = value;
                                    });
                                  } else {
                                    setState(() {
                                      signup = value;
                                    });
                                  }
                                },
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Invest());
                                },
                                child: Container(
                                  width: 229.17,
                                  height: 44.96,
                                  decoration: BoxDecoration(
                                      color: (signup) ? Colors.white : deepblue,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Center(
                                    child: Text(
                                      "Invest now",
                                      style: TextStyle(
                                          color: (signup)
                                              ? deepblue
                                              : Colors.white,
                                          fontSize: 14.99,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 221,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //ELEVENTH COMPONENT LAYOUT
            Container(
              width: double.infinity,
              height: 672,
              alignment: Alignment.center,
              color: deepblue,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: 957.89,
                  height: 462.71,
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      gradient: LinearGradient(colors: [lightblue, darkgreen])),
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Be the first to",
                            style: TextStyle(
                                fontSize: 44.96,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Text(
                            "download the app",
                            style: TextStyle(
                                fontSize: 44.96,
                                fontWeight: FontWeight.w800,
                                color: darkgreen),
                          ),
                          SizedBox(
                            height: 21.86,
                          ),
                          Text(
                            "Join the waiting list for early access and\nproduct updates.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.48,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 51.2,
                          ),
                          Container(
                            height: 50,
                            width: 550,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: 190,
                                    height: 50,
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: 12.49, color: darkgreen),
                                      decoration: InputDecoration(
                                          hintText: "Enter your e-mail address",
                                          hintStyle: TextStyle(
                                              fontSize: 12.49,
                                              color: lightblue),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: darkgreen)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue))),
                                    )),
                                SizedBox(
                                  width: 9,
                                ),
                                // Container(
                                //     width: 190,
                                //     height: 49,
                                //     alignment: Alignment.centerLeft,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(
                                //             width: 1.2,
                                //             color: lightblue),
                                //         borderRadius:
                                //         BorderRadius.circular(
                                //             9.36663)),
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //             width: 49,
                                //             alignment: Alignment.center,
                                //             decoration: BoxDecoration(
                                //               border: Border(
                                //                   right: BorderSide(
                                //                       width: 1.2,
                                //                       color:
                                //                       lightblue)),
                                //             ),
                                //             child: CountryCodePicker(
                                //               initialSelection: 'IT',
                                //               favorite: ['+39','FR'],
                                //               // optional. Shows only country name and flag
                                //               showCountryOnly: false,
                                //               // optional. Shows only country name and flag when popup is closed.
                                //               showOnlyCountryWhenClosed: false,
                                //               // optional. aligns the flag and the Text left
                                //               alignLeft: false,
                                //             )
                                //         ),
                                //         SizedBox(
                                //           width: 13,
                                //         ),
                                //         Expanded(
                                //           child: TextFormField(
                                //             decoration: InputDecoration
                                //                 .collapsed(
                                //               hintText:
                                //               "Your number too",
                                //               hintStyle: TextStyle(
                                //                   fontSize: 12.49,
                                //                   color: lightblue),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     )),
                                Container(
                                    width: 190,
                                    height: 50,
                                    child: TextFormField(
                                      controller: mobileController,
                                      style: TextStyle(
                                          fontSize: 12.49, color: darkgreen),
                                      decoration: InputDecoration(
                                          hintText: "Enter your number",
                                          hintStyle: TextStyle(
                                              fontSize: 12.49,
                                              color: lightblue),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: darkgreen)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      9.36663),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: lightblue))),
                                    )),
                                SizedBox(
                                  width: 9,
                                ),
                                Container(
                                    width: 152,
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        if (emailController.text.isEmpty ||
                                            mobileController.text.isEmpty) {
                                          return;
                                        }
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) =>
                                                ProgressDialog(
                                                    message: "Please wait..."));
                                        var data = {
                                          "email": emailController.text,
                                          "mobile": mobileController.text,
                                        };
                                        var res = await CallApi()
                                            .postData(data, "subscribe");
                                        var body = json.decode(res.body);
                                        print(body);
                                        emailController.clear();
                                        mobileController.clear();
                                        FocusScope.of(context).nextFocus();
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) => JoinGroup());
                                      },
                                      child: Text(
                                        "Get Early Access",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.3)),
                                          backgroundColor: darkgreen,
                                          primary: deepblue),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //TWELVETH COMPONENT LAYOUT
            Container(
              constraints: BoxConstraints(maxWidth: setwidth),
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 165,
                decoration: BoxDecoration(
                    color: deepblue,
                    border: Border(
                        top: BorderSide(width: 1.25, color: lightblue),
                        bottom: BorderSide(width: 1.25, color: lightblue))),
                child: Container(
                  height: 80,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.9,
                            child: Image(
                              image: AssetImage("assets/images/applestore.png"),
                              width: 150,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Image(
                              image: AssetImage("assets/images/goggleplay.png"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        color: deepblue.withOpacity(0.86),
                        child: Center(
                          child: Text(
                            "Coming soon!!!".toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 310.87,
              color: deepblue,
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 129,
                      ),
                      SizedBox(
                        height: 32.19,
                      ),
                      Container(
                        width: 340,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net1 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://m.facebook.com/5thprofantasy/');
                                },
                                child: Image(
                                    color: (net1) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[0]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net2 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://twitter.com/5thprofantasy?s=09');
                                },
                                child: Image(
                                    color: (net2) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[1]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net3 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://instagram.com/5thprofantasy?igshid=1tqbfpnca4ez1');
                                },
                                child: Image(
                                    color: (net3) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[2]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net4 = value;
                                  });
                                },
                                onTap: () async {
                                  await launch(
                                      'https://www.linkedin.com/company/5thpro');
                                },
                                child: Image(
                                    color: (net4) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[3]}"),
                                    width: 45.35),
                              ),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    net5 = value;
                                  });
                                },
                                onTap: () {},
                                child: Image(
                                    color: (net5) ? darpink : darkgreen,
                                    image: AssetImage(
                                        "assets/images/${network[4]}"),
                                    width: 45.35),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        "Copyright 2021 RedGeniux - All rights reserved.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: darkgreen),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _userAvatar(String avatar, String name, String position) {
    return Container(
      height: 286,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 161,
            height: 161,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/$avatar")),
                shape: BoxShape.circle),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 29.97,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
          Text(position,
              style: TextStyle(
                  fontSize: 22.48,
                  color: darkgreen,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class LevelThreeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 160);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 160);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class LevelThree3Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 100);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class LevelTwoClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height - 150);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class LevelTwo2Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class LevelFourClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height - 200);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class LevelFour4Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
