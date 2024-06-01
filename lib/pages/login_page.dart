import 'package:cat_app_project/components/my_button.dart';
import 'package:cat_app_project/components/my_textfield.dart';
import 'package:cat_app_project/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

 final void Function()? onTap;

 const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

  //login method
 void login() async{
   //show loading circle
   showDialog(context: context, builder: (context) =>
       Center(
         child: CircularProgressIndicator(),
   ));


   // try to sign in
   try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text);

     // pop loading circle
     if ( context.mounted) Navigator.pop(context);
   }

   //display error
   on FirebaseAuthException catch (e) {

     //pop loading circle
     Navigator.pop(context);
     displayMessageToUser(e.code, context);
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // cat logo
                Image(image: NetworkImage("https://i.pinimg.com/236x/e3/9b/8b/e39b8b21229316ec0f1757828e439904.jpg")),
                SizedBox(height: 25,),
          
                // app name
                Text("Welcome to the Cat World!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 25,),
          
          
                // email textfield
                MyTextField(
                    hintText: "Email",
                    controller: emailController,
                    obscureText: false),
                SizedBox(height: 10),
          
                // password textfield
                MyTextField(
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true),
                SizedBox(height: 15),
          
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?",
                         style: TextStyle(
                             fontSize: 16,
                             color: Colors.pink,
                             fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 15),
          
          
                //sign in button
                 MyButton(
                     text: "Login",
                     onTap: login,
                 ),
                SizedBox(height: 25),
          
          
                // don't have an acc? register here!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),),
                    SizedBox(width: 10,),
          
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Register here",
                          style: TextStyle(
                            color: Colors.pink,
                             fontWeight: FontWeight.bold,
                             fontSize: 16),),
                    ),
          
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),

    );
  }
}
