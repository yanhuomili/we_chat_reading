import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'base_card.dart';
import '../routers/application.dart';

//本周推荐
class CardRecommend extends BaseCard{
  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState{
  @override
  void initState() {
    subTitleColor = Colors.blue; // 重写subTitleColor
    super.initState();
  }

  @override
  // 重写topTitle
  topTitle(String title){ 
    return super.topTitle('本周推荐');
  }

  @override
  Widget subTitle(String title){
    return super.subTitle('送你一天无限卡.全场书籍免费阅读 >');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2462146637,4274174245&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: (){
                Application.router.navigateTo(context, '/bookDetail',transition: TransitionType.inFromRight);
              },
              child: Text('查看详情',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

}