@HtmlImport('turkish-number.html')
library fun_components.turkish_numbers;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:turkish_numbers/turkish_numbers.dart';


@PolymerRegister('turkish-number')
class TurkishNumberElement extends PolymerElement {
  @property String turkish_number;
  @Property(notify: true, observer: 'numberChanged') int number;

  TurkishNumberElement.created() : super.created();

  void attached() {
    super.attached();

    _getContentAndTransform();
  }

  void _getContentAndTransform() {
    //get the nodes with the markdown

    List<Node> nodes = new List.from(childNodes);

    nodes.remove($['number']);

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
  numberChanged([_, __]) {
    set('turkish_number', turkishIntToString(number));
  }
}