library fun_components.roman_numerals;

import 'dart:async';

import 'package:polymer/polymer.dart';
import 'package:roman_numerals/roman_numerals.dart';

@CustomTag('roman-numeral')
class RomanNumeralElement extends PolymerElement {
  @observable String numeral = "";
  @published int number;

  RomanNumeralElement.created() : super.created() {
    //new PathObserver(this, "number").open(numberChanged);//.changes.listen((e) => numberChanged());
  }

  attached() {
    super.attached();
  }

  numberChanged() {
    numeral = RomanNumerals.toRoman(number);
    print("Roman $numeral");
  }
}