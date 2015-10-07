@HtmlImport('ajax-get.html')
library fun_components.ajax_get;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


@PolymerRegister('ajax-get')
class AjaxGet extends PolymerElement {
  @Property(notify: true)
  String url;

  @Property(notify: true)
  bool auto;



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
    HttpRequest.request(url)
      .then(_fireResponse)
      .catchError(_fireError)
      .whenComplete(_fireComplete)
      ;
  }
}