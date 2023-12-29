import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hinttext;

  const TextFieldWidget(
      {super.key,
      required this.title,
      required this.controller,
      required this.obscureText,
      required this.hinttext});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInfocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInfocus = true;
        });
      } else {
        setState(() {
          isInfocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Container(
          decoration: isInfocus
              ? BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.075),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ])
              : BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.69),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ]),
          child: TextField(
            focusNode: focusNode,
            obscureText: widget.obscureText,
            controller: widget.controller,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: widget.hinttext,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
