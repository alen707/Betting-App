import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  final String name;
  final String imageOn;
  final String imageOff;
  final bool cho;
  final VoidCallback onTap;

  const Choice({
    super.key,
    required this.name,
    required this.imageOff,
    required this.imageOn,
    required this.cho,
    required this.onTap,
  });

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  //late bool test = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: widget.cho
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 225, 224, 224),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  widget.cho
                      ? Image.asset(widget.imageOn, width: 30, height: 30,color: const Color.fromARGB(255, 255, 255, 255),)
                      : Image.asset(widget.imageOff, width: 30, height: 30,color: Colors.grey,),
                  widget.cho
                      ? Text(
                          widget.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
