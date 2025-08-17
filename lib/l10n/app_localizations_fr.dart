// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Dorsaf Boughdiri - Développeur Mobile';

  @override
  String get heroTitle => 'Développeur Mobile';

  @override
  String get heroSubtitle => 'Flutter • iOS • Android • Full-Stack';

  @override
  String get aboutMeTitle => 'À Propos de Moi';

  @override
  String get aboutMeText1 =>
      'Je suis un développeur mobile passionné et expérimenté avec un historique prouvé de construction d\'applications VoIP et de chat de haute qualité publiées sur Google Play Store et Apple App Store.';

  @override
  String get aboutMeText2 =>
      'Avec une expertise en Flutter, Dart, Kotlin, Swift et NodeJS, je me spécialise dans la création d\'expériences cross-platform fluides qui offrent un engagement utilisateur et des performances exceptionnelles.';

  @override
  String get featuredProjectsTitle => 'Projets Principaux';

  @override
  String get comunikPhoneTitle => 'Comunik Phone';

  @override
  String get comunikPhoneDescription =>
      'Une plateforme de chat et de communication sophistiquée avec messagerie chiffrée, enregistrements d\'appels, authentification FaceID et support du mode sombre élégant. Disponible sur Google Play Store et Apple App Store.';

  @override
  String get comunikVisioTitle => 'Comunik Visio';

  @override
  String get comunikVisioDescription =>
      'Application de visioconférence professionnelle pour des réunions virtuelles fluides. Fonctionnalités d\'appels vidéo haute qualité, partage d\'écran et gestion des réunions. Disponible sur Google Play Store et Apple App Store.';

  @override
  String get comunikUnifiedTitle => 'Comunik Unified';

  @override
  String get allInOneSolution =>
      'Solution de communication tout-en-un combinant chat, appels vocaux et appels vidéo dans une seule application. Interface rationalisée pour une expérience de communication fluide. Disponible sur Google Play Store et Apple App Store.';

  @override
  String get comunikChatTitle => 'Comunik Chat';

  @override
  String get comunikChatDescription =>
      'Application de chat collaborative conçue pour la communication d\'équipe et la collaboration de projet. Fonctionnalités de chats de groupe, partage de fichiers et messagerie en temps réel. Disponible sur Google Play Store et Apple App Store.';

  @override
  String get comunikRmcTitle => 'Comunik RMC';

  @override
  String get comunikRmcDescription =>
      'Une solution tout-en-un complète pour gérer les interactions clients sur plusieurs canaux incluant Messenger, WhatsApp, Instagram, Telegram et plus encore. Fonctionnalités de supervision avancée, rapports et outils de gestion d\'équipe.';

  @override
  String get viewApp => 'Voir l\'App';

  @override
  String get technicalSkillsTitle => 'Compétences Techniques';

  @override
  String get mobileDevelopment => 'Développement Mobile';

  @override
  String get backendDatabase => 'Backend & Base de Données';

  @override
  String get toolsPlatforms => 'Outils & Plateformes';

  @override
  String get getInTouch => 'Me Contacter';

  @override
  String get choosePlatform => 'Choisir la Plateforme';

  @override
  String selectAppStore(Object appName) {
    return 'Sélectionnez votre boutique d\'applications préférée pour voir $appName';
  }

  @override
  String get googlePlay => 'Google Play';

  @override
  String get appStore => 'App Store';

  @override
  String get cancel => 'Annuler';

  @override
  String get copyright => '© 2024 Dorsaf Boughdiri. Tous droits réservés.';

  @override
  String get languageSelector => 'Langue';
}
