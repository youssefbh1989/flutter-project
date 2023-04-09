import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qatarservice/mainscreen.dart';
import 'package:qatarservice/views/auth/signinscreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign Up',style:
            TextStyle(fontWeight:
            FontWeight.bold,fontSize: 40,color: Colors.black,
            ),),
            SizedBox(height: 50,),
            TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Icon(Icons.person,color: Colors.black,),
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
            TextFormField(
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone,color: Colors.black),
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
                  Get.to(()=>MainScreen());
                },
                child: Text('Sign Up'),

                style: ElevatedButton.styleFrom(primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,

                  activeColor: Colors.black,

                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Text(
                  'I agree to the terms and conditions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Have an account ?',style:
                TextStyle(fontWeight:
                FontWeight.w400,fontSize: 15,color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>SignInPage());
                  },
                  child: Text('Sign In',style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
