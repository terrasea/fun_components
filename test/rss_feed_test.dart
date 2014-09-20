part of fun_components_test;

class RSSFeedComponent extends PageComponent {
  RSSFeedComponent(el) : super(el);

  callGet() => component.get();
  List get displayedItems => component.shadowRoot.querySelectorAll('rss-item');
}

rss_feed_test() {
  group('[rss-feed]', () {
    RSSFeedComponent component;

    setUp(() {
      schedule(() {
        PolymerElement el =
            createElement('<rss-feed href="syndication.rss"></rss-feed>');
        document.body.append(el);
        component = new RSSFeedComponent(el);
        return component.flush();
      });

      currentSchedule.onComplete.schedule(() => component.component.remove());
    });

    test('items are not displayed before get called', () {
      schedule(() {
        expect(component.currentTextDisplay.trim(), equals(''));
      });

    });

    test('items are displayed after get called', () {
      schedule(() {
        return component.callGet();
      });
      schedule(() {
        expect(component.displayedItems.length, 10);
      });
    });


    test('items display title, description and link', () {
      schedule(() {
        return component.callGet();
      });

      schedule(() {
        var completer = new Completer();

        print(component.component.items[0].title);

        print(component.displayedItems[0].text);

        (component.displayedItems[0] as PolymerElement).async((_) =>
            completer.complete());

        return completer.future;
      });

      var first_item_title = "One Yak Too Many?";
      var first_item_sample_text =
          "Yesterday I was able to get a Jenkins server up"
          " and running on a Linode, properly secured, and checking out Dart"
          " and JavaScript code for testing. Although the test script ran, I do"
          " not yet have a successful test—mostly due to lack of additional"
          " dependencies.";

      schedule(() {
        expect(component.displayedItems[0].shadowRoot.text,
            contains(first_item_title));
        expect(component.displayedItems[0].shadowRoot.text,
            contains(first_item_sample_text));
        expect(component.displayedItems[0].
            shadowRoot.
            querySelectorAll('a')[0].href,
            equals('http://feedproxy.google.com/~r/dartosphere/~3/RbPCWmdf_f4/'
                'one-yak-too-many.html'));
        expect(component.displayedItems[0].
            shadowRoot.
            querySelectorAll('a')[1].href,
            equals('http://jenkins-ci.org/'));
      });
    });
  });
}