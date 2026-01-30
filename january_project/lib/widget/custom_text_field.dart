import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyType;
  final String labl;
  final String hint;
  final String? counter;
  final String? hlp;
  final Widget preIcon;
  final Widget? sfxIcon;
  final bool obscureT;
  final String? Function (String?)? valid;


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
    this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
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
        prefixIcon: preIcon,
        suffixIcon: sfxIcon
      ),
      
    );
  }
}
