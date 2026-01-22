import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyType;
  final String labl;
  final String hint;
  final String? counter;
  final String? hlp;
  final IconData preIcon;
  final Widget? sfxIcon;
  final bool obscureT ;

  const CustomTextField({
    super.key,
    required this.keyType,
    required this.labl,
    required this.hint,
    this.counter,
    this.hlp,
    required this.preIcon,
    this.sfxIcon,
    this.obscureT = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyType,
      obscureText: obscureT,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        label: Text(labl ,style: TextStyle(
          fontFamily: 'Averia',
          fontWeight: .bold
        ),),
        hint: Text(hint),
        counterText: counter,
        prefixIcon: Icon(preIcon),
        suffixIcon: sfxIcon
      ),
      
    );
  }
}
