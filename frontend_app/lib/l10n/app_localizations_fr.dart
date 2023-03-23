import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get userName => 'nom d\'utilisateur';

  @override
  String get password => 'mot de passe';

  @override
  String get identifaction => 'identification';

  @override
  String get admin => 'administrateur';

  @override
  String get user => 'utilisateur';

  @override
  String get agent => 'agent';

  @override
  String get login => 'connexion';

  @override
  String get logout => 'déconnexion';

  @override
  String get addUser => 'ajouter un utilisateur';

  @override
  String get importUsersFromExcel => 'importer des utilisateurs depuis Excel';

  @override
  String get changeLanguage => 'changer la langue';

  @override
  String get arabic => 'arabe';

  @override
  String get english => 'anglais';

  @override
  String get french => 'français';

  @override
  String get userType => 'type d\'utilisateur';

  @override
  String get validityStartDate => 'debut de validité';

  @override
  String get validityEndDate => 'fin de validité';

  @override
  String get loginWithQr => 'connecter avec qr';

  @override
  String get loginWithCredentials => 'connecter avec identifiants';

  @override
  String get continueProcess => 'continuer le processus';

  @override
  String get registerVehicule => 'enregistrer un véhicule';

  @override
  String get acessGranted => 'access granted';

  @override
  String get acessDenied => 'access denied';

  @override
  String get unkown => 'inconnu';
}
