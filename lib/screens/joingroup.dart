import 'package:fifthproweb/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';


class JoinGroup extends StatefulWidget {
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: deepblue,
      child: Stack(
          children:
          [
            Container(
              width: 489,
              height: 405,
              padding: EdgeInsets.only(left: 48, right: 49, top: 51),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Image.asset("assets/images/ticket_emoji.png"),
                  SizedBox(height: 45.45,),
                  Text("Free Tickets!", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30, fontWeight: FontWeight.w800),),
                  SizedBox(height: 7,),
                  Container(
                    width: 292,
                    child: Text("Join the team on any channel for live updates and win free weekly tickets for a season ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15, fontWeight: FontWeight.w600),),
                  ),


SizedBox(height: 17,),

                  Row(
                    children: [
                      Container(
                          width: 190,
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: Icon(FontAwesome.whatsapp),
                            label: Text("Whatsapp Group"),
                            onPressed: () async{
                              await launch('https://chat.whatsapp.com/FjQpW7hmZT008BngRr6tmr');
                            },

                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        9.3)),
                                backgroundColor: sharpgreen,
                                primary: Colors.white),
                          )
                      ),
                      SizedBox(width: 12,),
                      Container(
                          width:190,
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: Icon(FontAwesome5.telegram_plane),
                            label: Text("Telegram Group"),
                            onPressed: ()async {
                              await launch('https://t.me/joinchat/2CRHX_Be90IxYmRk');
                            },

                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        9.3)),
                                backgroundColor: sharpblue,
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
