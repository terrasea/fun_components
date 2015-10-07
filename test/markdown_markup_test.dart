part of fun_components_test;


class MarkdownMarkupComponent extends PageComponent {
  MarkdownMarkupComponent(el) : super(el);

  Element get currentDestinationElement => component.$['destination'];

  Future flush() {
    Completer completer = new Completer();
    new Timer(new Duration(milliseconds: 500), () {
      super.flush().then((_) => super.flush().then((_) => completer.complete()));
    });

    return completer.future;
  }
}

//not testing if all markdown features works, as the used markdown package should do those tests.
markdown_markup_test() {
  group('[Markdown Markup]', () {
    MarkdownMarkupComponent markdown_component;
    var markdown;
    setUp(() {
        markdown = """
heading
=======
<strong id="someid">strong element</strong>
""";
        PolymerElement el = createElement('<markdown-markup>$markdown</markdown-markup>');
        document.body.append(el);
        markdown_component = new MarkdownMarkupComponent(el);

        return markdown_component.flush();

//      currentSchedule.onComplete.schedule(() => markdown_component.component.remove());
    });

    tearDown(() => markdown_component.component.remove());

    test('destination exists', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement, isNotNull);
      });
    });


    test('destination contents not same as markdown', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement.text, isNot(isEmpty));
        expect(markdown_component.currentDestinationElement.text, isNot(equals(markdown)));
      });
    });


    test('conmtains heading h1 element', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement.querySelector('h1'), isNotNull);
        expect(markdown_component.currentDestinationElement.querySelector('h1').text.trim(), equals('heading'));
      });
    });


    test('retains existing html elements', () {
      schedule(() {
        expect(markdown_component.currentDestinationElement.querySelector('strong'), isNotNull);
        expect(markdown_component.currentDestinationElement.querySelector('strong').text, equals('strong element'));
        expect(markdown_component.currentDestinationElement.querySelector('strong').attributes.keys, contains('id'));
        expect(markdown_component.currentDestinationElement.querySelector('strong').attributes['id'], contains('someid'));
      });
    });
  });
}