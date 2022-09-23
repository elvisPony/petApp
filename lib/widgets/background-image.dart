import 'package:flutter/material.dart';


class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.4),
            BlendMode.color,
          ),
          image: AssetImage('assets/images/img_1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
