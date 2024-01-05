import 'package:flutter/services.dart';

class HyphenFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';
    int selectionIndex = newValue.selection.end;

    // Remove all non-digit characters from the input string
    String unformattedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Insert hyphens at desired positions
    for (int i = 0; i < unformattedText.length; i++) {
      if (i == 3 || i == 7) {
        formattedText += '-';
      }
      formattedText += unformattedText[i];
    }

    // Maintain the cursor position
    selectionIndex += formattedText.length - newValue.text.length;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
