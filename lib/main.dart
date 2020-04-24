import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '舒尔特方格',
      home: SchulteCell(),
    );
  }
}

class SchulteCell extends StatefulWidget {
  SchulteCell({Key key}) : super(key: key);

  @override
  _SchulteCellState createState() => _SchulteCellState();
}

class _SchulteCellState extends State<SchulteCell>
    with TickerProviderStateMixin {
  int count;
  List<int> data = List();
  List<int> curSelectArr = List();
  List<AnimationController> controllers = List();
  List<Animation<Color>> animations = List();

  @override
  void initState() {
    super.initState();
    count = 16;
    List.generate(count, (index) {
      data.add(index + 1);
      controllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)));
      animations.add(ColorTween(end: Colors.purpleAccent, begin: Colors.white)
          .animate(controllers[index])
            ..addListener(() {
              setState(() {});
            }));
    });
    data.shuffle();
  }

  tapCell(i) {
    int lastSelsect = curSelectArr.length > 0 ? curSelectArr.last : 0;
    if (data[i] - 1 == lastSelsect) {
      animations[i] = ColorTween(end: Colors.purpleAccent, begin: Colors.white)
          .animate(controllers[i])
            ..addListener(() {
              setState(() {});
            });
      curSelectArr.add(data[i]);
    } else {
      animations[i] = ColorTween(end: Colors.redAccent, begin: Colors.white)
          .animate(controllers[i])
            ..addListener(() {
              setState(() {});
            });
    }
    controllers[i].forward(from: 0).then((value) => controllers[i].reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('舒尔特方格'),
      ),
      body: Center(
          child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                count,
                (index) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: animations[index].value),
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text(
                      '${data[index]}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      tapCell(index);
                    },
                  ),
                ),
              ))),
    );
  }
}
