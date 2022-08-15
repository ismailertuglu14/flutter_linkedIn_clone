import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utility/routes.dart';

class Appbar extends StatelessWidget {
  final String? title;
  const Appbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/logo.png', height: 50),
          title != null
              ? GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.register),
                  child: Text(
                    title!,
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
