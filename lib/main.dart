import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHome();
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle smallText = TextStyle(fontSize: 12);
    TextStyle bigText = TextStyle(fontSize: 20);
    return MaterialApp(
      title: "走你",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Container(
            width: 260,
            child: TabBar(
              controller: _controller,
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              labelStyle: bigText,
              unselectedLabelStyle: smallText,
              // labelColor: Colors.green,
              // unselectedLabelColor: Colors.pink,
              tabs: <Widget>[
                Tab(
                  child: Text('页面1'),
                ),
                Tab(
                  child: Text('页面2'),
                ),
                Tab(
                  child: Text('页面3'),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            Center(
              child: Text(
                '页面1',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                '页面2',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                '页面3',
                style: TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
        // bottomNavigationBar: ,
      ),
    );
  }
}
