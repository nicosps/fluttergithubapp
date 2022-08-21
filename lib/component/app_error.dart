import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errortxt;
  const AppError({Key? key, this.errortxt = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errortxt.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errortxt,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
