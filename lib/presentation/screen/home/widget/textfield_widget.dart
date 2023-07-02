import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Key? fieldKey;
  final String? hintText;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final BorderSide? enabledBorder;
  final TextInputType? keyboardType;
  final Widget? conditionText;
  final bool hasPasswordSuffixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final Color? fillColor;
  final BorderSide? focusedBorder;
  final int? maxLines;

  TextFieldWidget({
    super.key,
    this.fieldKey,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.enabledBorder,
    this.keyboardType,
    this.conditionText,
    this.hasPasswordSuffixIcon = false,
    this.suffixIcon,
    this.onTap,
    this.controller,
    this.readOnly = false,
    this.hintStyle,
    this.textAlign,
    this.isDense,
    this.contentPadding,
    this.style,
    this.fillColor,
    this.focusedBorder,
    this.maxLines,
  });

  @override
  _TextFieldWidgetState createState() => new _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureInput = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.conditionText ?? const SizedBox(),
        TextField(
          obscureText: widget.hasPasswordSuffixIcon ? _obscureInput : false,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          controller: widget.controller,
          readOnly: widget.readOnly,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: widget.style,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
              fillColor: widget.fillColor,
              contentPadding: widget.contentPadding ?? const EdgeInsets.all(15),
              filled: true,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              prefixIcon: widget.prefixIcon,
              isDense: widget.isDense,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: widget.focusedBorder ?? BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: widget.enabledBorder ?? BorderSide.none),
              suffixIcon: widget.hasPasswordSuffixIcon
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureInput = !_obscureInput;
                        });
                      },
                      child: Icon(_obscureInput
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  : widget.suffixIcon),
        ),
      ],
    );
  }
}
