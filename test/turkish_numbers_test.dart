part of fun_components_test;

class TurkishNumberComponent extends PageComponent {

  TurkishNumberComponent(el) : super(el);

  String get displayedNumber => component.querySelector('#number').text;
}

turkish_numbers_test() {
  group("[Turkish numerals]", () {
    TurkishNumberComponent turkish_component;

    setUp(() {
//      currentSchedule.onComplete.schedule(() => );
    });

    tearDown(() {
      turkish_component.component.remove();
    });

    test("display 0 as sıfır", () async {
      PolymerElement el = createElement('<turkish-number number="0"></turkish-number>');
      document.body.append(el);
      turkish_component = new TurkishNumberComponent(el);

      await turkish_component.flush();

      expect(turkish_component.displayedNumber.trim(), equals('sıfır'));
    });


    test("display 1000000000000 as bir trilyon", ()  async {
      PolymerElement el = createElement('<turkish-number number="1000000000000"></turkish-number>');
      document.body.append(el);
      turkish_component = new TurkishNumberComponent(el);

      await turkish_component.flush();

      expect(turkish_component.currentTextDisplay.trim(), equals('bir trilyon'));
    });

    test('set number from <content> of element', () async {
      PolymerElement el = createElement('<turkish-number>1000000000000</turkish-number>');
      document.body.append(el);
      turkish_component = new TurkishNumberComponent(el);

      await turkish_component.flush();

      expect(turkish_component.currentTextDisplay.trim(), equals('bir trilyon'));
    });

    test('set number from <content> of element with a invalid number', () async {
      PolymerElement el = createElement('<turkish-number>bir trilyon</turkish-number>');
      document.body.append(el);
      turkish_component = new TurkishNumberComponent(el);

      await turkish_component.flush();

      expect(turkish_component.currentTextDisplay.trim(), equals(''));
    });
  });
}