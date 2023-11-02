import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Container(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ), //Positioned
        ],
      ), //Stack
    ); //Centre
  }

  Widget buildImage() {
    final image = AssetImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ), //Ink.image
      ), //Material
    ); //ClipOval
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: color,
        all: 8,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      Container(
        child: child,
      );
}
