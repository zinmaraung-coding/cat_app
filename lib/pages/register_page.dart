import 'package:cat_app_project/components/my_button.dart';
import 'package:cat_app_project/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // register method
  Future<void> registerUser() async {
    // show loading circle
     showDialog(
         context: context,
         builder: (context) => const Center(
           child: CircularProgressIndicator(),
         ));

    // make sure passwords match
    if (passwordController.text != confirmPwController.text) {

      //pop loading error
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("Password don't match!", context);
    }

    // if password do match
   else {
      // try creating the user
      try {
        //crate the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        //pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        //display error message to user
        displayMessageToUser(e.code, context);
      }
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
                Image(
                    image: NetworkImage("https://i.pinimg.com/236x/33/66/90/3366902d3835db1f98d338da20241f6b.jpg")),
          
                SizedBox(height: 25,),
          
                // app name
                Text("Register below with your details!",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 25,),
          
          
                // username textfield
                MyTextField(
                    hintText: "Username",
                    controller: usernameController,
                    obscureText: false),
                SizedBox(height: 10),
          
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
          
               // Confirm password textfield
                MyTextField(
                    hintText: "Confirm Password",
                    controller: confirmPwController,
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
          
          
                // register in button
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
                SizedBox(height: 25),
          
          
                // don't have an acc? register here!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),),
                    SizedBox(width: 10,),
          
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login here",
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
