import 'package:flutter/material.dart';

class PrimaryPositiveButton extends StatelessWidget {
  const PrimaryPositiveButton({
    super.key,
    required this.text,
    required this.onTapEvent,
    required this.isEnabled,
  });

  final String text;
  final VoidCallback onTapEvent;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled
            ? Color.fromRGBO(0, 145, 234, 1)
            : Color.fromRGBO(189, 189, 189, 1),
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: isEnabled ? onTapEvent : null,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSansCJKKR",
        ),
      ),
    );
  }
}

class SecondaryPositiveButton extends StatelessWidget {
  const SecondaryPositiveButton({
    super.key,
    required this.text,
    required this.onTapEvent,
    required this.isEnabled,
  });

  final String text;
  final VoidCallback onTapEvent;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isEnabled
                ? Color.fromRGBO(0, 145, 234, 1)
                : Color.fromRGBO(189, 189, 189, 1),
            width: 1,
          ),
        ),
      ),
      onPressed: isEnabled ? onTapEvent : null,
      child: Text(
        text,
        style: TextStyle(
          color: isEnabled
              ? Color.fromRGBO(0, 145, 234, 1)
              : Color.fromRGBO(189, 189, 189, 1),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSansCJKKR",
        ),
      ),
    );
  }
}
