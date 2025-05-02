import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/class2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Login here....',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: obscure,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: obscure
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.panorama_fish_eye_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Password',
                ),
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    backgroundColor: const Color(0xff2A2346),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
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
                                    builder: (context) => Class2()));
                          },
                        text: ' Signup',
                        style: TextStyle(
                          color: Color(0xff2A2346),
                        ),
                      ),
                    ])),
              ),

              // GestureDetector(
              //   onTap: () {
              //     print('texting');
              //   },
              //   child: Container(
              //     height: 36,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Color(0xff2A2346),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: Center(
              //         child: Text(
              //       'Login',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     )),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
