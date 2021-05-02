import 'package:fifthproweb/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareLinksMobile extends StatefulWidget {
  @override
  _ShareLinksMobileState createState() => _ShareLinksMobileState();
}

class _ShareLinksMobileState extends State<ShareLinksMobile> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: deepblue,
      child: Stack(
          children:
          [
            Container(
              width: 481,
              height: 643,
              padding: EdgeInsets.only(left: 48, right: 49, top: 51),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Image.asset("assets/images/emoji.png"),
                  SizedBox(height: 45.45,),
                  Text("One more thing!", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30, fontWeight: FontWeight.w800),),
                  SizedBox(height: 7,),
                  Container(
                    width: 292,
                    child: Text("Help us spread the word for the love of the game! 🎮",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15, fontWeight: FontWeight.w600),),
                  ),


                  SizedBox(height: 37,),

                  Column(
                    children: [
                      Container(
                          width: 330,
                          height: 75,
                          child: OutlinedButton.icon(
                            icon: Icon(FontAwesome.facebook),
                            label: Text("Share on Facebook"),
                            onPressed: ()async {
                                await launch('https://m.facebook.com/5thprofantasy/');
                            },

                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        9.3)),
                                backgroundColor: facebook,
                                primary: Colors.white),
                          )
                      ),
                      SizedBox(height: 12,),
                      Container(
                          width: 330,
                          height: 75,
                          child: OutlinedButton.icon(
                            icon: Icon(FontAwesome5.twitter),
                            label: Text("Share on Twitter"),
                            onPressed: () async {
                             await launch('https://twitter.com/5thprofantasy?s=09');
                            },

                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        9.3)),
                                backgroundColor: twitter,
                                primary: Colors.white),
                          )),
                    ],
                  )


                ],),
            ),
            Positioned(
                top: 25,
                right: 25.26,
                child:  Material(
                  color: darpink,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(6.66),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32.74,
                      height: 32.74,
                      child: Center(child: Icon(Icons.clear, size: 24, color: Colors.white, )),
                    ),
                  ),
                )
            )
          ]
      ),
    );
  }
}
