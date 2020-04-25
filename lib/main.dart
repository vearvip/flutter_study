import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '抖嘤',
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.yellowAccent),
            child: Home()),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          // height: 100,
          width: screenWidth,
          child: Container(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: TopTab(),
          ),
        ),
        Positioned(
          bottom: 0,
          width: 0.70 * screenWidth,
          height: 150,
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
            child: BottomContent(),
          ),
        ),
        Positioned(
          right: 0,
          top: 0.37 * screenHeight,
          width: 0.25 * screenWidth,
          height: 0.3 * screenHeight,
          child: Container(
            decoration: BoxDecoration(color: Colors.orangeAccent),
              child: getButtonList(),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 * screenWidth,
          height: 0.25 * screenWidth,
          child: Container(
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: RotateAlbum(),
          ),
        )
      ],
    );
  }
}

class TopTab extends StatefulWidget {
  TopTab({Key key}) : super(key: key);

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
          Expanded(
              flex: 2,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
          Expanded(
              flex: 8,
              child: Container(
                height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TabBar(
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                      unselectedLabelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 20),
                      controller: _controller,
                      tabs: <Widget>[Text('关注'), Text('推荐')]))),
          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.live_tv,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              )),
        ],
      )
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        getBottomWidget('首页', true),
        getBottomWidget('同城', false),
        AddIcon(),
        getBottomWidget('消息', false),
        getBottomWidget('我', false),
      ],
    );
  }
}

class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 35,
            width: 50,
            child: Container(
              decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
              
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 5,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
getBottomWidget(String content, bool ifSelected) {
  return Text('$content', style: ifSelected ? TextStyle(fontSize: 18, color: Colors.white) : TextStyle(fontSize: 18, color: Colors.grey[300]),);
}

class BottomContent extends StatelessWidget {
  const BottomContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(title: Text('@人民日报'),subtitle: Text('卡开发阿拉斯加朵法拉世纪东方拉手孔地方了爱丽丝积分卡书法家阿康师傅是可控的开裆裤那个人鸟儿够热闹'),),
          Row(children: <Widget>[
            Icon(Icons.music_note),
            // Marquee(text: '人民日报创作的一些吧比较弱有啊老师逻辑朵法拉结束了多看看打卡',)
          ],)
        ],
      ),
    );
  }
}

class RotateAlbum extends StatefulWidget {
  RotateAlbum({Key key}) : super(key: key);

  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = RotationTransition(turns: Tween(begin: 0.0, end: 1.0).animate(_controller)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0.0);
      }     
    }),child: Icon(Icons.music_note),);
    // _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: animation,
    );
  }
}

getButtonList() {
  return Column(children: <Widget>[
    Container(
      width: 60,
      child: Stack(children: <Widget>[
        CircleAvatar(backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587746983925&di=6bcb3d87b550e41066c230f8c76c4bb1&imgtype=0&src=http%3A%2F%2Fimg2.woyaogexing.com%2F2019%2F03%2F14%2F1ce2963f747a4159a374c4591d599c3b%2521400x400.jpeg'),),
        Positioned(bottom: 0, left: 27.5,child: Container(
          child: Icon(Icons.add),
          decoration: BoxDecoration(color: Colors.redAccent),
        ),)
       ],)
    ),
    IconText(text: '999w',icon: Icon(Icons.favorite),)
  ],);
}

class IconText extends StatelessWidget {
  final Icon icon;
  final String text;
  const IconText({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        icon,
        Text(text)
      ],),
    );
  }
}