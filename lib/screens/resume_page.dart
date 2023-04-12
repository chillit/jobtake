import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final tc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              print("TAP!");
            },
            child: Text('Admin mode'),
          )
        ],
        title: Text("Wellcome!"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          OurTextField(TextController: tc, ltext: "test")
        ]),
      ),
    );
  }
}

class OurTextField extends StatefulWidget {
  const OurTextField({
    super.key,
    required this.TextController,
    required this.ltext,

  });

  final TextEditingController TextController;
  final String ltext;

  @override
  State<OurTextField> createState() => OurTextFieldState();
}

class OurTextFieldState extends State<OurTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.TextController,
      decoration: InputDecoration(
        labelText: widget.ltext,
      ),
    );
  }
}