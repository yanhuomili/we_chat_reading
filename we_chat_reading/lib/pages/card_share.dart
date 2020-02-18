import 'package:flutter/material.dart';
import 'base_card.dart';

//本周推荐
class CardShare extends BaseCard{
  @override
  _CardShareState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState{
  Color bottomTitleColor = Colors.grey;
  @override
  void initState() {
    subTitleColor = Colors.purple; // 重写subTitleColor
    super.initState();
  }

  @override
  // 重写topTitle
  topTitle(String title){ 
    return super.topTitle('分享得联名卡');
  }
  @override
  topTitle2() {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        bottom: 5
      ),
      child: Text(
        '/ 第19期',
        style: TextStyle(
          fontSize: 10
        ),
      ),
    );
  }

  @override
  Widget subTitle(String title){
    return super.subTitle('分享给朋友最多可获得12天无限卡');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Color(0xfff6f7f9)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                // padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
                padding: EdgeInsets.only(bottom: 20),
                child: Image.network(
                  'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4142587453,3986655608&fm=26&gp=0.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center, // 重写父级的布局
              child: Padding(
                padding: EdgeInsets.only(bottom: 20,),
                child: bottomTitle('26589784人 参与'),
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomTitle(String title){
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        color: bottomTitleColor
      ),
    );
  }

}