part of fun_components_test;

class GravatarImageComponent extends PageComponent {
  GravatarImageComponent(el) : super(el);

  ImageElement get currentGravatarImage => component.querySelector('#gravatar_image');
  String get currentGravatarEmail => component.email;
  String get currentGravatarImageURL => component.imageURL;
  int get currentGravatarSize => component.size;

  Future flush() {
    return super.flush().then((_) =>  super.flush());
  }
}

//I am not testing the Gravatar package, just making sure the values, fetched
//or not fetched like size get put in the right place.  Like the rule says,
//don't test other peoples code.
gravatar_image_test() {
  group('[Gravatar Image]', () {
    GravatarImageComponent gravatar_component;
    //steal the email address used by the gravatar package in testing
    //hopefully they won't mind.
    var email = 'hello@blossom.io';
    group('[create]', () {
      setUp(() {
        PolymerElement el = createElement('<gravatar-image email="$email"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      tearDown(() {
        gravatar_component.component.remove();
      });

      test('is not null', () {
        expect(gravatar_component.component, isNotNull);
      });
    });



    group('[src]', () {
      setUp(() {
        PolymerElement el = createElement('<gravatar-image email="$email" size="40"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      tearDown(() {
        gravatar_component.component.remove();
      });

      test('img src attribute is correct and has default values', () {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
        expect(gravatar_component.currentGravatarSize, 40);
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
      });


      test('size attribute sets right img src attribute', () {
        expect(gravatar_component.currentGravatarSize, equals(40));
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
      });
    });


    group('[defaults]', () {
      setUp(() {
        PolymerElement el = createElement('<gravatar-image email="$email" default-image="images/GoogleSearchBirthday.png"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      tearDown(() {
        gravatar_component.component.remove();

        querySelectorAll('gravatar-image').forEach((el) => el.remove());
      });

      test('default image', () {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?d=images/GoogleSearchBirthday.png'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?d=images/GoogleSearchBirthday.png'));
      });


      group('[size]', () {
        setUp(() {
          PolymerElement el = createElement('<gravatar-image email="$email" size="40" default-image="images/GoogleSearchBirthday.png"></gravatar-image>');
          document.body.append(el);
          gravatar_component = new GravatarImageComponent(el);

          return gravatar_component.flush();
        });

        tearDown(() {
          gravatar_component.component.remove();
        });

        test('default image and size', () {
          expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40&d=images/GoogleSearchBirthday.png'));
          expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40&d=images/GoogleSearchBirthday.png'));
        });
      });



      group('[forced]', () {
        setUp(() {
          PolymerElement el = createElement('<gravatar-image email="$email" force-default></gravatar-image>');
          document.body.append(el);
          gravatar_component = new GravatarImageComponent(el);

          return gravatar_component.flush();
        });

        tearDown(() {
          gravatar_component.component.remove();
        });

        test('force default', () {
          expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?f=y'));
          expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?f=y'));
        });
      });
    });


    group('[rating]', () {
      setUp(() {
        PolymerElement el = createElement('<gravatar-image email="$email" rating="pg"></gravatar-image>');
        document.body.append(el);
        gravatar_component = new GravatarImageComponent(el);

        return gravatar_component.flush();
      });

      tearDown(() {
        gravatar_component.component.remove();
      });

      test('rating set', () {
        expect(gravatar_component.currentGravatarImageURL, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?r=pg'));
        expect(gravatar_component.currentGravatarImage.src, equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?r=pg'));
      });
    });
  });
}