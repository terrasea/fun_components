library fun_components.entity;

import 'package:observe/observe.dart' show Reflectable, toObservable;

class HtmlEntityResolver extends Reflectable {
  final Map<String, String>  entities = toObservable({'&lt;': '<', '&gt;': '>'});

  String parse(String xml) {
    xml = xml.replaceAll(new RegExp(r'\\&'), '&');
    entities.forEach((key, val) {
      xml = xml.replaceAll(new RegExp(key), val);
    });

    return xml;
  }
}