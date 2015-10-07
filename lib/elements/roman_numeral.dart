@HtmlImport('roman-numeral.html')
library fun_components.roman_numerals;

import 'dart:async';
import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:roman_numerals/roman_numerals.dart';

@PolymerRegister('roman-numeral')
class RomanNumeralElement extends PolymerElement {
  @property String numeral = "";
  @Property(notify: true, observer: 'numberChanged') int number;

  RomanNumeralElement.created() : super.created();

  attached() {
    super.attached();

    _getContentAndTransform();
  }

  void _getContentAndTransform() {
    //get the nodes with the markdown

    List<Node> nodes = new List.from(childNodes);

    nodes.remove($['destination']);

    String text = nodes.map((el) => el is Text ? el.toString() : '').join('');

    if(text.trim().length > 0) {
      try {
        set('number', int.parse(text));
      } catch(e) {
        print(e);
      }
    }

    nodes.forEach((el) => el.remove());

  }

  @Observe('number')
  void numberChanged([_, __]) {
    set('numeral', RomanNumerals.toRoman(number));
  }
}
