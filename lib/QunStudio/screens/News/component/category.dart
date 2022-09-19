import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuContainer(
          press: () {},
          title: "All",
        ),
        MenuContainer(
          press: () {},
          title: "Media Coverage",
        ),
        MenuContainer(
          press: () {},
          title: "Upcoming Release",
        ),
      ],
    );
  }
}

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Text(
          title,
          style: TextStyle(
              color: Color.fromRGBO(238, 238, 238, 1),
              fontFamily: 'Rubik',
              fontSize: 20,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
      ),
    );
  }
}
