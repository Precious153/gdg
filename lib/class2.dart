import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/texting.dart';

class Class2 extends StatefulWidget {
  const Class2({super.key});

  @override
  State<Class2> createState() => _Class2State();
}

class _Class2State extends State<Class2> {
   bool obscure =  true;
   final _formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController();
   final _passwordController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(height: 8,),
                Text(
                  'Register here....',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  validator: _validateEmail,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  validator: (val){
                    if(val!.isEmpty) return "Password Required";
                    return null;
                  },
                  obscureText: obscure,
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon:obscure ? Icon(Icons.remove_red_eye) : Icon(Icons.panorama_fish_eye_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                  ),
                onTap: (){
                  setState(() {
                    obscure = !obscure;
                  });
                },
                ),
                SizedBox(height: 24,),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Texting()));
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      backgroundColor: const Color(0xff2A2346),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                //
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: " Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                              text: ' Signup',
                              style: TextStyle(
                                color: Color(0xff2A2346),
                              ),
                            ),
                          ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? _validateEmail(String? value) {
  if (value!.isEmpty) return 'Email is required';
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}



String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  RegExp hasLowercase = RegExp(r'(?=.*[a-z])');
  RegExp hasUppercase = RegExp(r'(?=.*[A-Z])');
  RegExp hasNumber = RegExp(r'(?=.*[0-9])');
  RegExp hasSpecialChar = RegExp(r'(?=.*[^A-Za-z0-9])');

  if (!hasLowercase.hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!hasUppercase.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!hasNumber.hasMatch(value)) {
    return 'Password must contain at least one number';
  }
  if (!hasSpecialChar.hasMatch(value)) {
    return 'Password must contain at least one special character';
  }

  return null; // Valid password
}
