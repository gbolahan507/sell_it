import 'package:flutter/material.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/h1.dart';

Widget CustomInput({
  validator,
  hintext,
  focusedBorder,
  fillcolor,
  enableBorder,
  onchanged,
  labelText,
  filled,
  suffixIcon,
  haeding,
  height,
  obsecuretext,
  fontweight,
  onTapsuffixicon,
  prefixIcon,
  labelfontsize,
  labelweight,
  TextEditingController controller,
}) {
  return Container(
    child: Column(
      children: [
        Apptext(
          text: labelText,
          color: blackcolor,
          fontsize: 18,
          fontweight: FontWeight.w700,
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          onChanged: onchanged,
          controller: controller,
          textAlign: TextAlign.justify,
          validator: validator,
          obscureText: obsecuretext ?? false,
          decoration: InputDecoration(
            labelText: haeding,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'OpenSans'),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: hintext,
          ),
        ),
      ],
    ),
  );
}
