part of fun_components_test;


class TextSpeechComponent extends PageComponent {


  TextSpeechComponent(el) : super(el);


  Future flush() {
    return super.flush().then((_) {
      Completer completer = new Completer();
      component.async(() => completer.complete());

      return completer.future;
    });
  }
}

/*I'm not sure how I'll test this, since it's output will be audio.
 * I'll have to think about this one, but it might be untestable via the
 * automated test route.  Also Dartuim and content_shell, I think, are missing
 * the required service connection to run this API.
 *
 * Mocking doesn't seem to work for me, so just checking basic things like,
 * making sure element exists and synthesiser is not null, etc.
 */
text_speech_test() {
  group("[text-voice]", () {
    var textspeech_component;

    setUp(() {
        //synthesiser.speak(uterance);
        PolymerElement el = createElement('<text-speech>We are one</text-speech>');
        document.body.append(el);
        textspeech_component = new TextSpeechComponent(el);

        return textspeech_component.flush();
    });

    tearDown(() => textspeech_component.component.remove());


    test("element exists", () {
      schedule(() {
        expect(querySelector('text-speech'), isNotNull);
      });
    });


    test("synthesiser is not null", () {
      schedule(() {
        expect(querySelector('text-speech').synthesiser, isNotNull);
      });
    });


    test("synthesiser is SpeechSynthesiser", () {
      schedule(() {
        expect(querySelector('text-speech').synthesiser is SpeechSynthesiser, isTrue);
      });
    });
  });
}