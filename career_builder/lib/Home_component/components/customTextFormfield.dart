import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {

  final String label;
  final Widget icon;
  final bool isPassword;
  final Function validator;
  final Function onSaved;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextFormField({Key key, this.label, this.icon, this.isPassword = false, this.validator, this.onSaved,this.keyboardType,this.inputFormatters}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(


        keyboardType:keyboardType ,
    inputFormatters:inputFormatters,
        style: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold),
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
           enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold),
          suffixIcon: icon,

        ),
      validator: validator,
        onSaved: onSaved,
    );
  }
}