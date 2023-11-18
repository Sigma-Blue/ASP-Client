import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

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
Widget buildDivider() => const SizedBox(
      height: 24,
      child: VerticalDivider(),
    );
Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        children: <Widget>[
          Text('$value',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
 