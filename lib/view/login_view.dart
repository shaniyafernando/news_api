import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/button.dart';
import '../widget/input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    double symmetricHorizontalPadding = 25.0;
    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('top', style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white
                    ),),
                    Text('news', style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black
                    ),)
                    ],
                    ),

                    const SizedBox(height: 60,),

                    InputField(
                        symmetricHorizontalPadding: symmetricHorizontalPadding,
                        hintText: 'Email',
                        controller: _emailController,
                        obscureText: false),
                    const SizedBox(height: 10,),

                    InputField(
                        symmetricHorizontalPadding: symmetricHorizontalPadding,
                        hintText: 'Password',
                        controller: _passwordController,
                        obscureText: true),
                    const SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: symmetricHorizontalPadding),
                      child: Button(
                          colour: Colors.black54,
                          textColour: Colors.white,
                          buttonText: 'Sign In',
                          fontSize: 16.0,
                          buttonTapped: signIn),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}
