import 'package:flutter/material.dart';

class Style {
  //Colors
  static final Color textColor = Colors.black;
  static final Color primaryColor = Color(0xFFff6962);
  static final Color backgroundColor = Color(0xFFf4f4f4);

  // FontSize
  static final double fontSizeBody = 16;

  // TextFields

  static Widget textFieldWithLabel(
    label,
    controller,
    context, {
    enabled = true,
    keyboardType,
    textCapitalization,
    obscure,
    textInputAction,
    focusNode,
    nextFocusNode,
    suffixIcon,
    isDeletable,
    prefixIcon,
    colorText,
    hintText,
    expands,
  }) {
    return TextField(
      autocorrect: false,
      keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
      textCapitalization: textCapitalization == null
          ? TextCapitalization.sentences
          : textCapitalization,
      autofocus: false,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled ? true : enabled,
      onSubmitted:
          textInputAction != null && textInputAction == TextInputAction.next
              ? (term) {
                  focusNode.unfocus();
                  FocusScope.of(context).requestFocus(nextFocusNode);
                }
              : null,
      obscureText: obscure == null ? false : obscure,
      style: TextStyle(
        fontSize: fontSizeBody,
        color: colorText != null
            ? colorText
            : enabled ? textColor : textColor.withOpacity(0.5),
      ),
      textInputAction:
          textInputAction == null ? TextInputAction.done : textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 0, right: 0, bottom: 15),
                child: new SizedBox(
                  width: 24,
                  child: prefixIcon,
                )),
        suffixIcon: suffixIcon != null
            ? suffixIcon
            : isDeletable != null && isDeletable && controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: Style.primaryColor),
                    onPressed: () {
                      controller.clear();
                    })
                : null,
        filled: true,
        fillColor: Colors.grey.shade200,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(color: Colors.black, width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
                color: controller.text.isNotEmpty
                    ? Colors.black
                    : Colors.transparent,
                width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
                color: controller.text.isNotEmpty
                    ? Colors.black
                    : Colors.transparent,
                width: 2)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
                color: controller.text.isNotEmpty
                    ? Colors.black
                    : Colors.transparent,
                width: 2)),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hintText == null ? null : hintText,
      ),
      maxLines:
          expands != null && expands || keyboardType == TextInputType.multiline
              ? null
              : 1,
      expands: expands != null ? expands : false,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
