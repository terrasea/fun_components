import 'package:polymer/polymer.dart';

import 'dart:html';

@CustomTag('ajax-get')
class AjaxGetElement extends PolymerElement {
  @observable @published String url = "";
  @published bool auto = false;

  AjaxGetElement.created() : super.created();


  attached() {
    if(auto == true) {
      go();
    }
  }


  _fireResponse(HttpRequest request) {
    String result = request.responseText;
    print("Result: $result");
    fire('get-response', detail: result);
  }


  _fireError(ProgressEvent obj) {
    fire('get-error', detail: obj.target.status);
  }



  _fireComplete() {
    fire('get-completed');
  }


  go() {
    HttpRequest.request(url)
      .then(_fireResponse)
      .catchError(_fireError)
      .whenComplete(_fireComplete);
  }
}