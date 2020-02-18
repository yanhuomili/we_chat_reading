import 'package:flutter/material.dart';
import 'content_pager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _currentIndex = 0;
  final ContentPagerController _contentPagerController = ContentPagerController();
  @override
  Widget build(BuildContext context) {
    /* 初始化设计尺寸 */
    ScreenUtil.init(context,width:750,height:1334);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffedeef0),
              Color(0xffe6e7e9),
              // Colors.blue,
              // Colors.pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          onPageChanged: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: (index) {
          _contentPagerController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomItem('本周', Icons.folder, 0),
          _bottomItem('分享', Icons.explore, 1),
          _bottomItem('免费', Icons.donut_small, 2),
          _bottomItem('长安', Icons.person, 3)
        ],
      ),
    );
  }

  // 底部Tab封装
  _bottomItem(String title, IconData icon, int index){
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title, 
        style: TextStyle(
          color: _currentIndex != index ? Colors.grey : Colors.blue
        ),
      )
    );
  }
}