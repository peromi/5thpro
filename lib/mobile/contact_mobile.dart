import 'dart:convert';

import 'package:fifthproweb/data/api.dart';
import 'package:fifthproweb/mobile/thankyou_mobile.dart';
import 'package:fifthproweb/screens/progressdialog.dart';
import 'package:fifthproweb/utils/mycolors.dart';
import 'package:flutter/material.dart';

class ContactMobile extends StatefulWidget {
  @override
  _ContactMobileState createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController  messageController = TextEditingController();

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
              height: 673,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello!", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30, color: Colors.white),),
                      SizedBox(width: 4,),
                      Image.asset("assets/images/emojistar.png")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Is there something you would like to\nshare with us? Send it here.👇🏽", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),),

                  SizedBox(height: 14,),
                  Column(
                    children: [
                      Container(
                          width: 377,
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(color: darkgreen, fontSize: 25),
                            decoration: InputDecoration(
                             contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                                hintText:
                                "Enter your fullname",
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
SizedBox(height: 20,),
                      Container(
                          width: 377,

                          child: TextFormField(
                            style: TextStyle(color: darkgreen),
                            controller: emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                    ],
                  ),
                  SizedBox(height: 14,),
                  Container(
                      width: 377,

                      child: TextFormField(
                        controller: messageController,
                        maxLines: 8,
                        style: TextStyle(color: darkgreen),
                        decoration: InputDecoration(
                            hintText:
                            "Enter your message here...",
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
                  SizedBox(height: 14,),
                  Container(
                      width: 377,
                      height: 75,
                      child: OutlinedButton(
                        onPressed: () async{
                          showDialog(context: context, builder: (context)=>ProgressDialog(message: "Please wait..."));
                          var data = {
                            'name':nameController.text,
                            'email':emailController.text,
                            'message':messageController.text
                          };
                          var res = await CallApi().postData(data, "contact-us");
                          var body = json.decode(res.body);
                          print(body);
                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                          FocusScope.of(context).nextFocus();
                          Navigator.pop(context);
                          showDialog(context: context, builder: (context)=>ThankYouMobile());
                        },
                        child: Text(
                          "Send us a message",
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
