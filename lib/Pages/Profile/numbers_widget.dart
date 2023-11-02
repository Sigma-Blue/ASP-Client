import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(text: 'Posts', value: 39),
          buildDivider(),
          buildButton(text: 'Following', value: 500),
          buildDivider(),
          buildButton(text: 'Followers', value: 600),
          buildDivider(),
        ],
      );
}

Widget buildDivider() => Container(
      height: 24,
      child: VerticalDivider(),
    );

Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        children: <Widget>[
          Text('$value',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
