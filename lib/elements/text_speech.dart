library fun_components.text_speech;

import 'dart:html' show ContentElement, window, SpeechSynthesisUtterance, SpeechRecognition, SpeechRecognitionEvent, querySelector;

import 'package:polymer/polymer.dart';


@CustomTag('text-speech')
class TextVoiceElement extends PolymerElement {
  var synthesiser = new SpeechSynthesiser(window.speechSynthesis);

  TextVoiceElement.created() : super.created();

  attached() {
    super.attached();

    var text = ($['text'] as ContentElement).getDistributedNodes().fold('', (prev, current) => "$prev${current.text}");

    synthesiser.speak(new SpeechSynthesisUtterance(text));
  }
}


/*
 * This was an attempt to make it testable, which hasn't worked out.
 * However it can stay as is, since it still does the job.
 */
@reflectable
class SpeechSynthesiser {
  var synthesiser;

  SpeechSynthesiser(this.synthesiser);

  speak(uterance) {
    synthesiser.speak(uterance);
  }
}