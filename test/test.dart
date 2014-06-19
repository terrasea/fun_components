library fun_components_test;

import 'package:scheduled_test/scheduled_test.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

//import 'package:fun_components/elements/text_speech.dart' show SpeechSynthesiser;

//part 'roman_numerals_test.dart';
//part 'turkish_numbers_test.dart';
//part 'credit_card_verifier_test.dart';
//part 'markdown_markup_test.dart';
//part 'gravatar_image_test.dart';
//part 'text_speech_test.dart';

main() {
  useHtmlConfiguration(true);
  group('[dummy test group]', () {
    test('dummy test', () {
      schedule(() {
        expect(true, isTrue);
      });
    });
  });
  //initPolymer();
  //.run(() {
  //roman_numerals_test();
  //turkish_numbers_test();
  //credit_card_verifier_test();
  //markdown_markup_test();
  //gravatar_image_test();
  //text_speech_test();
  //pollForDone(testCases);
  //});
}


pollForDone(List tests) {
  if (tests.every((t)=> t.isComplete)) {
    window.postMessage('dart-main-done', window.location.href);
    return;
  }

  var wait = new Duration(milliseconds: 100);
  new Timer(wait, ()=> pollForDone(tests));
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