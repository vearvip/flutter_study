import 'package:flutter/material.dart';

import 'components/Marquee.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '抖嘤',
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.grey[800]), child: Home()),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 65,
            // decoration: BoxDecoration(color: Colors.pink[200]),
            decoration: BoxDecoration(color: Colors.black),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // double rpx = screenWidth / 750;

    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0,
            child: Container(
                height: 0.8 * screenHeight,
                width: screenWidth,
                child: Image(
                  image:
                      NetworkImage('https://s1.ax1x.com/2020/04/25/JyFQLd.jpg'),
                  fit: BoxFit.fitWidth,
                ))),
        Positioned(
          top: 0,
          // height: 100,
          width: screenWidth,
          child: SafeArea(
              child: Container(
            height: 60,
            // decoration: BoxDecoration(color: Colors.blue),
            decoration: BoxDecoration(color: Colors.black),
            child: TopTabBar(),
          )),
        ),
        Positioned(
          bottom: 0,
          width: 0.70 * screenWidth,
          height: 150,
          child: Container(
            // decoration: BoxDecoration(color: Colors.blueGrey),
            child: IntroduceContent(),
          ),
        ),
        Positioned(
          right: 0,
          top: 0.39 * screenHeight,
          width: 0.25 * screenWidth,
          height: 0.4 * screenHeight,
          child: Container(
            // decoration: BoxDecoration(color: Colors.deepOrangeAccent[400]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                getAvatarButton(),
                IconText(
                  icon: Icons.favorite,
                  text: '点赞',
                ),
                IconText(
                  icon: Icons.chat,
                  text: '回复',
                ),
                IconText(
                  icon: Icons.reply,
                  text: '分享',
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 * screenWidth,
          height: 0.25 * screenWidth,
          child: Container(
            // decoration: BoxDecoration(color: Colors.deepOrangeAccent[200]),
            // decoration: BoxDecoration(color: Colors.greenAccent),
            child: RotateAlbum(),
          ),
        )
      ],
    );
  }
}

class TopTabBar extends StatefulWidget {
  TopTabBar({Key key}) : super(key: key);

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Icon(
                Icons.live_tv,
                size: 30,
                color: Colors.white,
              )),
          Expanded(
              flex: 8,
              child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _controller,
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                      unselectedLabelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 20),
                      tabs: <Widget>[
                        Text('关注'),
                        Text('推荐'),
                      ]))),
          Expanded(
              flex: 2,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
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
        getBottomWidget('我的', false),
      ],
    );
  }
}

Widget getBottomWidget(String text, bool isActive) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 18, color: isActive ? Colors.white : Colors.grey[300]),
  );
}

class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 58,
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Stack(
          children: <Widget>[
            Positioned(
              height: 35,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              height: 35,
              width: 50,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              height: 35,
              width: 50,
              right: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}

class IntroduceContent extends StatelessWidget {
  const IntroduceContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '@唯二',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '红酥手，黄滕酒，满城春色宫墙柳。东风恶，欢情薄。一怀愁绪，几年离索。错，错，错。春如旧，人空瘦，泪痕红浥鲛绡透。桃花落，闲池阁。山盟虽在，锦书难托。莫，莫，莫。',
              style: TextStyle(color: Colors.white, height: 1.6),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 18,
              ),
              Icon(
                Icons.music_video,
                color: Colors.white,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 30),
                    child: MarqueeWidget(
                      child: Text(
                          '是的发生发阿斯顿发送到发是发生的发生福特人二二二从V型变相逼try头晕乎乎福星高照预付款弄得弄年代末镀膜吗', 
                          style: TextStyle(color: Colors.white),),
                      direction: Axis.horizontal,
                    ),
                  ))
            ],
          )
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

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.forward(from: 0.0);
          }
        }),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://pic1.zhimg.com/80/v2-5c5a20672ed3bcabd96cca9b42213f1e_720w.jpg'),
      ),
    );
    // _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: animation,
    );
  }
}

getAvatarButton() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Stack(
          children: <Widget>[
            Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587809822699&di=b8161654ccd7110183977316059b51fb&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F6222b2799186b5190cc81d93b3af942b2cdb5cc22f7b6-DsUaEE_fw658'),
                )),
            Positioned(
              bottom: 0,
              left: 30,
              child: Container(
                child: Icon(
                  Icons.add,
                  size: 13,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(color: Colors.redAccent),
              ),
            )
          ],
        ),
      )
    ],
  );
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  IconText({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconTextColor = Colors.white;
    double iconSize = 45.0;
    double textSize = 13.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: iconTextColor,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(color: iconTextColor, fontSize: textSize),
        )
      ],
    );
  }
}
