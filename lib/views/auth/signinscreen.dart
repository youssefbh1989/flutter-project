import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qatarservice/views/auth/signupscreen.dart';

import 'otpscreen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome',style: 
              TextStyle(fontWeight:
              FontWeight.bold,fontSize: 40,color: Colors.black,
              ),),
            SizedBox(height: 50,),
            TextFormField(
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone,color: Colors.black,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            )
            ,
            SizedBox(height: 20.0),
            SizedBox(
              height: 50.0,
              width: 400.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPVerificationPage(),
                  ));
                },
                child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Dont have account ?',style:
                TextStyle(fontWeight:
                FontWeight.w400,fontSize: 15,color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>SignUpPage());
                  },
                  child: Text('Signup',style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold
                  ),),
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
