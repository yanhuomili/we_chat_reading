import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'card_free.dart';
import 'card_recommend.dart';
import 'card_share.dart';
import 'card_special.dart';
import 'custom_appbar.dart';

class ContentPager extends StatefulWidget {
  //回调方法
  final ValueChanged<int> onPageChanged; // 内部调用外部
  final ContentPagerController contentPagerController; // 外部调用内部
  // 构造方法
  ContentPager({Key key, this.onPageChanged, this.contentPagerController}) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
    viewportFraction: 0.8
  );
  static List<Color> _colors= [
    Colors.blue,
    Colors.grey,
    Colors.green,
    Colors.pink
  ];

  @override
  void initState(){
    if(widget.contentPagerController != null){
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appbar
        CustomAppBar(),
        Expanded(
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardFree()),
              _wrapItem(CardSpecial()),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(Widget widget){
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  // 状态栏样式-沉浸式状态栏
  _statusBar(){
    // 黑色沉浸式状态栏，基于SystemUiOverlayStyle.dart修改statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      // statusBarColor: null,
      statusBarColor: Colors.transparent, // 修改成透明色
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

//内容区域控制器
class  ContentPagerController{
  PageController _pageController;
  void jumpToPage(int page){
    //dart编程技巧：安全的调用 ?.的方式
    _pageController?.jumpToPage(page);
  }
}