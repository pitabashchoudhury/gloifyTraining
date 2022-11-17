import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const FlowApp());

class FlowApp extends StatefulWidget {
  const FlowApp({super.key});

  @override
  State<FlowApp> createState() => _FlowAppState();
}

class _FlowAppState extends State<FlowApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Flow Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 1,
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: const Image(
                    image: NetworkImage('https://picsum.photos/536/354'),
                  ),
                  title: const Text("Wel Come To World"),
                  subtitle: const Text("the new world"),
                  isThreeLine: true,
                  trailing: const Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/454'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/373'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/455'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                elevation: 1,
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: const Image(
                    image: NetworkImage('https://picsum.photos/536/334'),
                  ),
                  title: const Text("Wel Come To World"),
                  subtitle: const Text("the new world"),
                  isThreeLine: true,
                  trailing: const Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/354'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/374'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/470'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                elevation: 1,
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: const Image(
                    image: NetworkImage('https://picsum.photos/536/304'),
                  ),
                  title: const Text("Wel Come To World"),
                  subtitle: const Text("the new world"),
                  isThreeLine: true,
                  trailing: const Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/350'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/354'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              const Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Image(
                    image: NetworkImage('https://picsum.photos/536/410'),
                  ),
                  title: Text("Dragonnier"),
                  subtitle: Text("Dracaena"),
                  isThreeLine: true,
                  trailing: Icon(Icons.more_vert),
                ),
              ),
            ],
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
        Icons.chrome_reader_mode,
        Icons.call,
        Icons.facebook,
      ].map<Widget>((IconData icon) => buildItem(icon)).toList(),
    );
  }

  Widget buildItem(IconData icon) {
    return SizedBox(
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
        onPressed: () async {
          if (icon == Icons.chrome_reader_mode) {
            // QuickAlert.show(
            //     context: context,
            //     type: QuickAlertType.error,
            //     title: 'Welcome',
            //     text: "This is Email Icon");

            await launchUrl(
              Uri.parse('https://www.google.com/'),
            );
          } else if (icon == Icons.call) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                title: 'Welcome',
                text: "This is Call Icon");
          } else if (icon == Icons.facebook) {
            // launchUrl(
            //   Uri.parse('https://www.facebook.com/'),
            // );
            await launchUrl(
              Uri.parse('https://www.facebook.com/'),
            );
            //   QuickAlert.show(
            //       context: context,
            //       type: QuickAlertType.info,
            //       title: 'Welcome',
            //       text: "This is Notification Icon");
          }

          if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
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
