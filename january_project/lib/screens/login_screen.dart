import 'package:flutter/material.dart';
import 'package:january_project/screens/home_screen.dart';
import 'package:january_project/screens/nav_bar.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:january_project/widget/custom_text_field.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool pass = true;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorClass.buttons),
      backgroundColor: ColorClass.backG,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                height: height * 0.45,
                child: Lottie.network(
                  'https://lottie.host/400bf0bb-5bd3-45e5-bc1d-eba62c935cbf/wL2O8OaRn4.json',
                ),
              ),
              Spacer(),
              CustomTextField(
                valid: (value) {
                  if (!(checkEmail(value!))) {
                    return 'This email not valid ';
                  } else {
                    return null;
                  } //true
                },
                keyType: TextInputType.emailAddress,
                labl: 'Email',
                hint: 'Email@example.com',
                preIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 10),
              CustomTextField(
                valid: (value) {
                  if (!(checkpassword(value!))) {
                    return 'This Password not valid';
                  } else {
                    return null;
                  }
                },
                keyType: TextInputType.text,
                labl: 'Password',
                hint: '********',
                obscureT: pass,
                preIcon: Icon(Icons.lock),
                sfxIcon: InkWell(
                  onTap: () {
                    setState(() {
                      pass = !pass;
                    });
                  },
                  child: pass
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: ColorClass.buttons,
                ),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => NavBar()),
                        (route) => false,
                      );
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorClass.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkEmail(String email) {
    String pattern =
        r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
    return RegExp(pattern).hasMatch(email);
  }

  bool checkpassword(String Password) {
    String pattern2 =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    return RegExp(pattern2).hasMatch(Password);
  }
}
