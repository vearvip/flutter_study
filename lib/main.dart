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
          // leading: Icon(Icons.arrow_back),
          titleSpacing: 0,
          bottom: TabBar(
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
          title: Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: '这里相当于<input />的placeholder',
                    border: InputBorder.none, // 去掉默认选中的蓝线
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    )),
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.book),
              padding: EdgeInsets.only(left: 0),
              onPressed: () {},
            ),
            
          ],
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
              child: genContentList(),
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

class Content {
  String title;
  String subTitle;
  String avatarUrl;
  String userName;
  String userDesc;
  Content() {
    title = '你会记得你至今吃过多少片面包么？';
    subTitle =
        '鸭！你是叫爱丽娜吧，我看你和JOJO的关系很不错嘛，我感觉有些奇怪，最近他应该郁郁寡欢的，啊～鸭，鸭蛋，不愧是dio，能轻易做到我们做不到的，真是让人血脉喷张，你和JOJO接吻了吗？还没有吧，你接吻的对象不是JOJO，';
    avatarUrl =
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=997776165,73493573&fm=26&gp=0.jpg';
    userName = 'Dio';
    userDesc = '关注我立马认做你父亲';
  }
}

genContentList() {
  var content = Content();
  List<Content> list = List();
  List.generate(10, (index) => list.add(content));
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        elevation: 3,
        child: Container(
            // color: Colors.white,
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(content.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 25,
                            height: 25,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(content.avatarUrl),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            content.userName,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(content.userDesc)
                        ],
                      ),
                      Text(
                        content.subTitle,
                        style: TextStyle(height: 2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('667点赞·384评论'),
                          Icon(Icons.more_horiz)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      );
    },
  );
}
