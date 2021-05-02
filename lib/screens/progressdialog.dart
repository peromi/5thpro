import 'package:fifthproweb/utils/mycolors.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  String message;
  ProgressDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: deepblue,
      child: Container(
        width: 200,
        height: 64,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
            SizedBox(width: 12,),
            Text(message, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
