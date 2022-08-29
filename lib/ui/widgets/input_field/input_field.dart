import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// class TextFormFieldWidget extends StatefulWidget {
//   final TextInputType keyboardType;
//   final String hintText;
//   final Widget suffixContainer;
//
//   final bool obscureText;
//   final TextEditingController controller;
//   final String validationMessage;
//   final double opacity;
//
//   const TextFormFieldWidget(
//       {
//         required this.keyboardType,
//         required this.hintText,
//         required this.suffixContainer,
//
//         required this.obscureText,
//         required this.controller,
//         required this.validationMessage,
//         required this.opacity,
//       });
//
//   @override
//   _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
// }
//
// class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
//
//   late IconButton suffixIcon;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: TextFormField(
//           autofocus: true,
//           obscureText: widget.obscureText,
//           keyboardType: widget.keyboardType,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             suffixIcon: widget.suffixContainer,
//             fillColor: Colors.grey[800],
//             filled: true,
//             hintStyle: TextStyle(fontSize: 16, color: Colors.white),
//             hintText: widget.hintText,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.white,
//                 width: 1.0,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.white,
//                 width: 1.0,
//               ),
//             ),
//
//
//             // icon: icon!=null? Image.asset(
//             //   icon,
//             //   width: UtilWidget.horizontalBlock(4),
//             //   height: UtilWidget.horizontalBlock(4),
//             // ):Icon(null)
//           ),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return widget.validationMessage;
//             }
//             return null;
//           }
//       ),
//     );
//   }
// }


class TextFormFieldWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final Widget suffixContainer;
  final bool obscureText;
  final TextEditingController controller;
  final String validationMessage;
  final double opacity;

  const TextFormFieldWidget(
      {
        required this.keyboardType,
        required this.suffixContainer,
        required this.obscureText,
        required this.controller,
        required this.validationMessage,
        required this.opacity,
      });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  late IconButton suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            autofocus: true,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            controller: TextEditingController(),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: widget.suffixContainer,
              fillColor: Colors.grey[800],
              filled: true,
              hintStyle: TextStyle(fontSize: 16, color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              //return widget.validationMessage;
              return "This field is required";
            }
            return null;
          }
    );
  }
}

class LabelWidget extends StatefulWidget {

  final String textLabel;

  const LabelWidget(
    {
    required this.textLabel,
    });

  @override
  _LabelWidgetState createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  late String textLabel;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: textLabel,
                style: TextStyle(color: Colors.white, fontSize: 16.0,),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(color: Colors.red, fontSize: 16.0,),
              ),
            ]
        )
    );
  }
}


