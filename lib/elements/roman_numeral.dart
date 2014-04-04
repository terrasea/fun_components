library fun_components.roman_numerals;

import 'package:polymer/polymer.dart';
import 'package:roman_numerals/roman_numerals.dart';


@CustomTag('roman-numeral')
class RomanNumeralElement extends PolymerElement {
  @observable String roman_numeral;
  @published String number;

  RomanNumeralElement.created() : super.created();

  numberChanged() {
    roman_numeral = RomanNumerals.toRoman(int.parse(number));
  }
}