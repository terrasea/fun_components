library fun_components.gravatar_image;

import 'package:polymer/polymer.dart';
import 'package:gravatar/gravatar.dart';


@CustomTag('gravatar-image')
class GravatarImageElement extends PolymerElement {
  @published String email;
  @observable String imageURL;
  @published int size = null;
  @published String defaultImage = null;
  @published bool forceDefault = false;
  @published String rating = null;

  GravatarImageElement.created() : super.created();


  enteredView() {
    super.enteredView();

    imageURL = new Gravatar(email).imageUrl(size: size, defaultImage: defaultImage, forceDefault: forceDefault, rating: rating);
  }
}