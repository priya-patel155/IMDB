import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedtext extends StatefulWidget {
  final String? text;
  final Color? color;
  final double? size;

  const modifiedtext({Key? key, this.text, this.color, this.size})
      : super(key: key);

  @override
  State<modifiedtext> createState() => _modifiedtextState();
}

class _modifiedtextState extends State<modifiedtext> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text!,
        style: GoogleFonts.roboto(color: widget.color, fontSize: widget.size));
  }
}
