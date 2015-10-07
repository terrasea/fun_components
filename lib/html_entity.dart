library fun_components.entity;

class HtmlEntityResolver {
  final Map<String, String>  entities = {'&lt;': '<', '&gt;': '>'};

  String parse(String xml) {
    xml = xml.replaceAll(new RegExp(r'\\&'), '&');
    entities.forEach((key, val) {
      xml = xml.replaceAll(new RegExp(key), val);
    });

    return xml;
  }
}