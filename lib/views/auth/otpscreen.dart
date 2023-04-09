import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../mainscreen.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OTP Verification',style:
            TextStyle(fontWeight:
            FontWeight.bold,fontSize: 40,color: Colors.black,
            ),),
            Text('We have set OTP to your mobile number',style:
            TextStyle(fontWeight:
            FontWeight.w300,fontSize: 15,color: Colors.black,
            ),),
            SizedBox(height: 50,),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              maxLength: 6,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),

            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 50.0,
              width: 400.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MainScreen(),
                  ));
                },
                child: Text('Verify OTP'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
