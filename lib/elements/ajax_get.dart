import 'package:polymer/polymer.dart';

import 'dart:html';

@CustomTag('ajax-get')
class AjaxGet extends PolymerElement {
  @PublishedProperty(reflect: true)
  String get url => readValue(#url);
  set url(val) => writeValue(#url, val);

  @PublishedProperty(reflect: true)
  bool get auto => readValue(#auto) != null ? readValue(#auto) : false;
  set auto(val) => writeValue(#auto, val);



  AjaxGet.created() : super.created();


  attached() {
    if(auto == true) {
      go();
    }
  }


  _fireResponse(HttpRequest request) {
    String result = request.responseText;
    fire('get-response', detail: result);
  }


  _fireError(ProgressEvent obj) {
    fire('get-error', detail: obj.target.status);
  }



  _fireComplete() {
    fire('get-completed');
  }


  go() {
    print('go');
    HttpRequest.request(url)
      .then(_fireResponse)
      .catchError(_fireError)
      .whenComplete(_fireComplete)
      ;
  }
}