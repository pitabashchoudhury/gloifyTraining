import 'package:flutter/material.dart';

void main() => runApp(const FlowApp());

class FlowApp extends StatelessWidget {
  const FlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Flow Example'),
        ),
        body: const Center(
          child: Text(
            "Flow Widgets",
          ),
        ),
        floatingActionButton: const FlowMenu(),
      ),
    );
  }
}

class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: <IconData>[
        Icons.menu,
        Icons.mail,
        Icons.call,
        Icons.notifications,
      ].map<Widget>(buildItem).toList(),
    );
  }

  Widget buildItem(IconData icon) => SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          elevation: 0.0,
          splashColor: Colors.black,
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;
  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - 50.0;
    final yStart = size.height - 50.0;
    for (int i = context.childCount - 1; i >= 0; i--) {
      const margin = 8;
      final childSize = context.getChildSize(i)!.width;
      final dx = (childSize + margin) * i;

      final x = xStart - dx * 1 * controller.value;
      final y = yStart - dx * 1 * controller.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
