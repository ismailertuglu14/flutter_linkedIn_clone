import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/product/constants/constants.dart';
import 'package:social/product/providers/theme_notifier.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final String? icon;
  final VoidCallback function;
  const CustomButton(
      {Key? key,
      required this.title,
      this.bgColor,
      this.textColor,
      this.icon,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final notifier = Provider.of<ThemeNotifier>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: GestureDetector(
        onTap: function,
        child: Container(
          width: width,
          height: height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: bgColor ??
                  (notifier.dark ? Constants.lightBG : Constants.darkBG),
            ),
            color: bgColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        icon!,
                        height: 35,
                      ),
                    )
                  : const SizedBox(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: bgColor != null
                      ? Colors.white
                      : (notifier.dark ? Constants.lightBG : Constants.darkBG),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
