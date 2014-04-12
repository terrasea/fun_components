library fun_components.gravatar_image;

import 'package:polymer/polymer.dart';
import 'package:gravatar/gravatar.dart';


@CustomTag('gravatar-image')
class GravatarImageElement extends PolymerElement {
  @published String email;
  @observable String imageURL;
  @published int size = 0;
  @published String css;

  GravatarImageElement.created() : super.created();


  enteredView() {
    super.enteredView();

    imageURL = size == 0 ? new Gravatar(email).imageUrl() : new Gravatar(email).imageUrl(size: size);
  }
}