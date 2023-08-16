import 'package:auth_app/constant/image_constant.dart';
import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomMenuButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: size.width,
          height: 50.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(ImageConstant.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
