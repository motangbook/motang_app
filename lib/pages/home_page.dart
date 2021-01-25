import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_page.dart';
import 'search_page.dart';
import 'shelve_page.dart';
import 'book_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // 定义底部导航
  final List<BottomNavigationBarItem> bottomTable=[
    BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.bookmark),
        label: "书架"
    ),
    BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.book_circle),
        label: "书库"
    ),
    BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.search_circle),
        label: "发现"
    ),
    BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.profile_circled),
        label: "我"
    ),
  ];
  // 底部导航实例
  final List bottomBody = [
    new ShelvePage(),
    new BookPage(),
    new SearchPage(),
    new UserPage()
  ];
  // 索引
  int currentIndex = 0;
  // 选中的实例
  var currentBody;

  // 初始化默认第一个导航被选中
  @override
  void initState() {
    currentBody = bottomBody[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 初始化 屏幕适配  后面不用初始化了
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTable,
        // 切换时触发方法
        onTap: (index){
          setState(() {
            // 将选中的导航索引赋值
            currentIndex = index;
            // 获取到当前导航实例
            currentBody = bottomBody[currentIndex];
          });
        },
      ),
      // 挂载实例
      body:currentBody ,
    );
  }
}
