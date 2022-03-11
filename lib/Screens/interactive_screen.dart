import 'package:flutter/material.dart';

class InteractiveScreeen extends StatefulWidget {
  InteractiveScreeen({Key? key}) : super(key: key);

  @override
  State<InteractiveScreeen> createState() => _InteractiveScreeenState();
}

class _InteractiveScreeenState extends State<InteractiveScreeen> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Widgets"),
      ),
      body: Column(
        children: [
          Draggable(
            data: Colors.blue,
            childWhenDragging: Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              width: 100,
              height: 100,
              child: const Text(
                "Behind",
                textAlign: TextAlign.center,
              ),
            ),
            feedback: Material(
              child: Container(
                alignment: Alignment.center,
                color: Colors.purple,
                width: 100,
                height: 100,
                child: const Text(
                  "Draggable Widget",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 100,
              height: 100,
              child: const Text(
                "Draggable Widget",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          DragTarget<Color>(
            onAccept: (data) => setState(() {
              color = data;
            }),
            builder: (context, _, __) => Container(
              alignment: Alignment.center,
              color: color,
              width: 100,
              height: 100,
              child: const Text(
                "Drag Target",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
