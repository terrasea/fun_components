library fun_components_test;

import 'package:scheduled_test/scheduled_test.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

part 'roman_numerals_test.dart';
part 'turkish_numbers_test.dart';
part 'credit_card_verifier_test.dart';
part 'markdown_markup_test.dart';
part 'gravatar_image_test.dart';

main() {
  initPolymer().run(() {
    useHtmlConfiguration(true);
    roman_numerals_test();
    turkish_numbers_test();
    credit_card_verifier_test();
    markdown_markup_test();
    gravatar_image_test();
  });
}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}


class PageComponent {
  var component;

  PageComponent(this.component);

  Future flush() {
    Completer completer = new Completer();
    component.async((_) => completer.complete());

    return completer.future;
  }


  String get currentTextDisplay => component.shadowRoot.text;
}