import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  final Error exception;

  const WidgetError({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 30,
        ),
        Text(
          "Une erreur est survenue",
          textAlign: TextAlign.center,
          style: _getTextStyleError(context),
        ),
        Text(
          exception.stackTrace.toString(),
          textAlign: TextAlign.center,
          style: _getTextStyleError(context),
        )
      ],
    );
  }

  TextStyle _getTextStyleError(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).errorColor,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );
  }
}
