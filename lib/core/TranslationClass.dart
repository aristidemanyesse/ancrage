import 'package:get/get.dart';

class TranslationClass extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'menubar_home': 'Home',
          'menubar_activity': 'Activities',
          'menubar_galerie': 'Galerie',
          'logged_in': 'logged in as @name with email @email',
        },
        'fr_Fr': {
          'menubar_home': 'Acceuil',
          'menubar_activity': 'Activités',
          'menubar_galerie': 'Galerie',
          'logged_in': 'iniciado sesión como @name con e-mail @email',
        }
      };
}
