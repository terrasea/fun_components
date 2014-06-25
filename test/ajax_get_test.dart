part of fun_components_test;


class FunAjaxComponent extends PageComponent {
  Completer<String> _response = new Completer<String>();
  Completer<int> _error = new Completer<int>();
  Completer<bool> _complete = new Completer<bool>();

  FunAjaxComponent(el) : super(el) {
    el.on['get-response'].listen((e) {
      _response.complete(e.detail);
    });


    el.on['get-error'].listen((e) {
      _error.complete(e.detail);
    });


    el.on['get-completed'].listen((e) {
      _complete.complete(true);
    });
  }


  Future<String> get result => _response.future;
  Future<int> get error => _error.future;
  Future<bool> get complete => _complete.future;


  Future flush() {
    return super.flush().then((_) => super.flush());
  }
}


ajax_get_test() {
  FunAjaxComponent component;
  group('[ajax-get]', () {
    setUp(() {
      currentSchedule.onComplete.schedule(() => component.component.remove());
    });


    test("Basic use", () {
      schedule(() {
        PolymerElement el = createElement('<ajax-get></ajax-get>');
        el.url = "ajax_test.txt";
        document.body.append(el);
        component = new FunAjaxComponent(el);

        return component.flush();
      });

      schedule(() {
        component.component.go();
        component.result.then((contents) {
          expect(contents, equals('This is a test'));
        });
        expect(component.result, completes);
      });
    });


    test("auto attribute works", () {
        schedule(() {
          PolymerElement el = createElement('<ajax-get></ajax-get>');
          el.url = "ajax_test.txt";
          el.auto = true;
          document.body.append(el);
          component = new FunAjaxComponent(el);

          return component.flush();
        });

        schedule(() {
          component.result.then((contents) {
            expect(contents, equals('This is a test'));
          });
          expect(component.result, completes);
        });
      });



      test("handles errors", () {
          schedule(() {
            PolymerElement el = createElement('<ajax-get></ajax-get>');
            el.url = "not_exist.txt";
            el.auto = true;
            document.body.append(el);
            component = new FunAjaxComponent(el);

            return component.flush();
          });

          schedule(() {
            component.error.then((msg) {
              expect(msg, equals(404));
            });
            expect(component.error, completes);
          });
       });



      test("complete event is fired", () {
          schedule(() {
            PolymerElement el = createElement('<ajax-get></ajax-get>');
            el.url = "ajax_test.txt";
            el.auto = true;
            document.body.append(el);
            component = new FunAjaxComponent(el);

            return component.flush();
          });

          schedule(() {
            component.complete.then((result) {
              expect(result, isTrue);
            });
            expect(component.complete, completes);
          });
       });
   });
}