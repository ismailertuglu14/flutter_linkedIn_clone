import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              height: 2,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('or'),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
