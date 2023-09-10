import 'package:flutter/material.dart';
 class CustomTextField extends StatelessWidget {
    CustomTextField({super.key,this.onChanged, required this.hintText , this.obsecureText=false});
 final String hintText;
 Function(String)? onChanged;
 bool? obsecureText;
   @override
   Widget build(BuildContext context) {
     return  TextFormField(
      
      obscureText: obsecureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.black,
        ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              )
            ),
          ),
     );
   }
 }