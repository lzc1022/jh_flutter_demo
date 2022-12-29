import 'package:flutter/material.dart';
import '/project/configs/project_config.dart';
import 'http_page_test_model.dart';

class HttPageTestCell extends StatelessWidget {
  const HttPageTestCell({
    Key? key,
    required this.model,
    this.onClickCell,
  }) : super(key: key);

  final HttpPageTestModel model;
  final Function(dynamic model)? onClickCell;

  @override
  Widget build(BuildContext context) {
    bool isHidden = model.phone!.isEmpty;

    Color textColor = Colors.black;
    model.state = model.state == '2' ? '已完成' : (model.state == '1' ? '处理中' : '流转中');
    if (model.state == '流转中') {
      textColor = Colors.red;
    } else if (model.state == '处理中') {
      textColor = Colors.red;
    } else if (model.state == '已完成') {
      textColor = Colors.orange;
    }

    var spaceHeight = 10.0;
    return GestureDetector(
      onTap: () => onClickCell?.call(model.toJson()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        decoration: KStyles.cellBorderStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: spaceHeight),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Text('地点：' + model.place.jhNullSafe, style: TextStyle(fontSize: 18.0))),
                Row(
                  children: <Widget>[
                    Text(model.state.jhNullSafe, style: TextStyle(fontSize: 18.0, color: textColor)),
                    SizedBox(width: 10),
                    Image.network(model.imageUrl!, width: 30, height: 30),
                  ],
                )
              ],
            ),
            SizedBox(height: spaceHeight),
            // Text('联系人电话：' + model.phone.jhNullSafe, textAlign: TextAlign.left, style: TextStyle(fontSize: 18.0)),
            Offstage(
              offstage: isHidden,
              child: Text(
                '联系人电话：' + model.phone.jhNullSafe,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Offstage(offstage: isHidden, child: SizedBox(height: spaceHeight)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('问题描述：', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                Expanded(child: Text(model.content.jhNullSafe, style: TextStyle(fontSize: 18.0))),
              ],
            ),
            SizedBox(height: spaceHeight),
          ],
        ),
      ),
    );
  }
}
