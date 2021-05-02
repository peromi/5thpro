import 'package:fifthproweb/utils/mycolors.dart';
import 'package:flutter/material.dart';

class ThankYou extends StatefulWidget {
  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
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
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                 Image.asset("assets/images/emojiblow.png"),
                  SizedBox(height: 23,),
                  Text("Awesome!", style: TextStyle(
                    color: Colors.white,
                      fontSize: 30, fontWeight: FontWeight.w800),)
                  
                
                 
                  
                
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
