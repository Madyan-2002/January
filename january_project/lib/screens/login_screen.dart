import 'package:flutter/material.dart';
import 'package:january_project/screens/home_screen.dart';
import 'package:january_project/styles/color_class.dart';
import 'package:january_project/widget/custom_text_field.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(205, 215, 178, 147),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Lottie.network(
                'https://lottie.host/400bf0bb-5bd3-45e5-bc1d-eba62c935cbf/wL2O8OaRn4.json',
              ),
            ),
            SizedBox(height: 50),
            CustomTextField(
              keyType: TextInputType.emailAddress,
              labl: 'Email',
              hint: 'Email@example.com',
              preIcon: Icons.email_outlined,
            ),
            SizedBox(height: 10),
            CustomTextField(
              keyType: TextInputType.emailAddress,
              labl: 'Password',
              hint: '**********',
              preIcon: Icons.lock,
              sfxIcon: Icon(Icons.visibility_off),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 15,
                backgroundColor: ColorClass.buttons,
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
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
    );
  }
}
