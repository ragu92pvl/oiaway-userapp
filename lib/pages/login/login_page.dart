

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateX<LoginPage> {

  _LoginPageState() : super(controller: AuthController(), useInherited: true) {
    con = controller as AuthController;
  }
  late AuthController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: con.serviceKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0,),
                  Image.asset("assets/images/logo.png",height: 200,width: 200,),
                  SizedBox(height: 0,),
                  Text("Login",style: AppStyle.fontSarabunBold.override(fontSize: 18,color: Colors.black87),),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    onSaved: (e){
                      con.loginRequest.mobile = e!;
                    },
                    decoration: InputDecoration(
                      hintText: "Mobile number", // Hint text
                      hintStyle: TextStyle(color: Colors.grey), // Style for hint
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border on focus
                        borderSide: BorderSide(color: Colors.green, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border when enabled
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside the field
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onSaved: (e){
                      con.loginRequest.password = e!;
                    },
                    decoration: InputDecoration(
                      hintText: "Password", // Hint text
                      hintStyle: TextStyle(color: Colors.grey), // Style for hint
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border on focus
                        borderSide: BorderSide(color: Colors.green, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border when enabled
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside the field
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: Text("Forget password",style: AppStyle.fontSarabunBold.override(fontSize: 16,color: Colors.black87),)),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      con.login(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.themeColor, AppColors.themeColor], // Gradient colors
                            begin: Alignment.topCenter, // Gradient start
                            end: Alignment.bottomCenter, // Gradient end
                          ),
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          border: Border.all(color: Colors.white, width: 2), // Border
                        ),
                        child: Center(
                          child: Text(
                            "SignIn",
                            style: AppStyle.fontSarabunBold.override(color: Colors.white,fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      context.push('/register');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account? ",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.black87),),
                        Text("SignUp",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: AppColors.themeColor),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
