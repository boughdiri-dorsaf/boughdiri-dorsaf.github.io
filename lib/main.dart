import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio_page/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Dorsaf Boughdiri - Mobile Developer Portfolio',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
        Locale('ar'), // Arabic
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  Locale _currentLocale = const Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _currentLocale,
      child: Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;

          return Scaffold(
            backgroundColor: const Color(0xFFFAFAFA),
            body: CustomScrollView(
              slivers: [
                // Hero Section
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue[800]!,
                          Colors.blue[600]!,
                          Colors.indigo[600]!,
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            // Language Selector
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: DropdownButton<Locale>(
                                    value: _currentLocale,
                                    dropdownColor: Colors.blue[800],
                                    style: const TextStyle(color: Colors.white),
                                    underline: Container(),
                                    items: const [
                                      DropdownMenuItem(
                                        value: Locale('en'),
                                        child: Text(
                                          '🇺🇸 EN',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Locale('fr'),
                                        child: Text(
                                          '🇫🇷 FR',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Locale('ar'),
                                        child: Text(
                                          '🇸🇦 AR',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                    onChanged: (Locale? newLocale) {
                                      if (newLocale != null) {
                                        _changeLanguage(newLocale);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage(
                                  'assets/profile.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Dorsaf Boughdiri',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                l10n.heroTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              l10n.heroSubtitle,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // About Section
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(l10n.aboutMeTitle, showDivider: true),
                        const SizedBox(height: 20),
                        Text(
                          l10n.aboutMeText1,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          l10n.aboutMeText2,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Projects Section
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 20),
                          child: sectionTitle(
                            l10n.featuredProjectsTitle,
                            showDivider: true,
                          ),
                        ),
                        enhancedProjectCard(
                          l10n.comunikPhoneTitle,
                          l10n.comunikPhoneDescription,
                          'https://apps.apple.com/us/app/comunik-phone/id6463440797',
                          Icons.chat_bubble,
                          Colors.blue,
                          [
                            'Flutter',
                            'Dart',
                            'FaceID',
                            'Encryption',
                            'Dark Mode',
                            'Cross-Platform',
                          ],
                          _currentLocale,
                          l10n.viewApp,
                        ),
                        const SizedBox(height: 20),
                        enhancedProjectCard(
                          l10n.comunikVisioTitle,
                          l10n.comunikVisioDescription,
                          'https://apps.apple.com/us/app/comunik-visio/id6746748496',
                          Icons.video_call,
                          Colors.purple,
                          [
                            'Flutter',
                            'Dart',
                            'WebRTC',
                            'Video Calls',
                            'Screen Sharing',
                            'Cross-Platform',
                          ],
                          _currentLocale,
                          l10n.viewApp,
                        ),
                        const SizedBox(height: 20),
                        enhancedProjectCard(
                          l10n.comunikUnifiedTitle,
                          l10n.allInOneSolution,
                          'https://apps.apple.com/us/app/comunik-unified/id6739617673',
                          Icons.phone_in_talk,
                          Colors.orange,
                          [
                            'Flutter',
                            'Dart',
                            'VoIP',
                            'Chat',
                            'Video Calls',
                            'Unified Platform',
                          ],
                          _currentLocale,
                          l10n.viewApp,
                        ),
                        const SizedBox(height: 20),
                        enhancedProjectCard(
                          l10n.comunikChatTitle,
                          l10n.comunikChatDescription,
                          'https://apps.apple.com/us/app/comunik-chat/id6448245589',
                          Icons.forum,
                          Colors.teal,
                          [
                            'Flutter',
                            'Dart',
                            'Real-time Chat',
                            'File Sharing',
                            'Group Collaboration',
                            'Cross-Platform',
                          ],
                          _currentLocale,
                          l10n.viewApp,
                        ),
                        const SizedBox(height: 20),
                        enhancedProjectCard(
                          l10n.comunikRmcTitle,
                          l10n.comunikRmcDescription,
                          'https://apps.apple.com/us/app/comunik-rmc/id6738097198',
                          Icons.business,
                          Colors.indigo,
                          [
                            'Flutter',
                            'Dart',
                            'Multi-channel CRM',
                            'Customer Management',
                            'Team Supervision',
                            'Cross-Platform',
                          ],
                          _currentLocale,
                          l10n.viewApp,
                        ),
                      ],
                    ),
                  ),
                ),

                // Skills Section
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(
                          l10n.technicalSkillsTitle,
                          showDivider: true,
                        ),
                        const SizedBox(height: 25),
                        skillCategory(l10n.mobileDevelopment, [
                          'Flutter',
                          'Dart',
                          'Kotlin',
                          'Swift',
                          'Android',
                          'iOS',
                        ]),
                        const SizedBox(height: 20),
                        skillCategory(l10n.backendDatabase, [
                          'NodeJS',
                          'PHP',
                          'MongoDB',
                          'SQL',
                          'NoSQL',
                          'Firebase',
                          'REST APIs',
                        ]),
                        const SizedBox(height: 20),
                        skillCategory(l10n.toolsPlatforms, [
                          'Git',
                          'VS Code',
                          'Xcode',
                          'Android Studio',
                          'Figma',
                        ]),
                      ],
                    ),
                  ),
                ),

                // Contact Section
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue[800]!, Colors.indigo[600]!],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.getInTouch,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        enhancedContactLink(
                          Icons.email,
                          "boughdiridorsaf12@gmail.com",
                          "mailto:boughdiridorsaf12@gmail.com",
                          Colors.white,
                        ),
                        const SizedBox(height: 15),
                        enhancedContactLink(
                          Icons.link,
                          "LinkedIn Profile",
                          "https://linkedin.com/in/boughdiri-dorsaf-78508a146",
                          Colors.white,
                        ),
                        const SizedBox(height: 15),
                        enhancedContactLink(
                          Icons.code,
                          "GitHub Portfolio",
                          "https://github.com/boughdiri-dorsaf",
                          Colors.white,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                // Footer
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      l10n.copyright,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget sectionTitle(String title, {bool showDivider = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      if (showDivider) ...[
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ],
  );
}

Widget skillCategory(String category, List<String> skills) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children:
            skills
                .map(
                  (skill) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    ],
  );
}

Widget enhancedProjectCard(
  String title,
  String description,
  String link,
  IconData icon,
  Color color,
  List<String> technologies,
  Locale currentLocale,
  String viewAppText,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                technologies
                    .map(
                      (tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                showPlatformSelectionDialog(title, currentLocale);
              },
              icon: const Icon(Icons.smartphone),
              label: Text(viewAppText),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void showPlatformSelectionDialog(String appName, Locale currentLocale) {
  // Define app-specific links
  Map<String, Map<String, String>> appLinks = {
    'Comunik Phone': {
      'googlePlay':
          'https://play.google.com/store/apps/details?id=db.voip.voip_app',
      'appStore': 'https://apps.apple.com/us/app/comunik-phone/id6463440797',
    },
    'Comunik Visio': {
      'googlePlay':
          'https://play.google.com/store/apps/details?id=db.unified.visio',
      'appStore': 'https://apps.apple.com/us/app/comunik-visio/id6746748496',
    },
    'Comunik Unified': {
      'googlePlay':
          'https://play.google.com/store/apps/details?id=db.unified.chat_voip&hl=en',
      'appStore': 'https://apps.apple.com/us/app/comunik-unified/id6739617673',
    },
    'Comunik Chat': {
      'googlePlay':
          'https://play.google.com/store/apps/details?id=comunik.crm.unifiedcrm',
      'appStore': 'https://apps.apple.com/us/app/comunik-chat/id6448245589',
    },
    'Comunik RMC': {
      'googlePlay':
          'https://play.google.com/store/apps/details?id=comunik.crm.rmc_app',
      'appStore': 'https://apps.apple.com/us/app/comunik-rmc/id6738097198',
    },
  };

  final links =
      appLinks[appName] ??
      {
        'googlePlay': 'https://play.google.com',
        'appStore': 'https://apps.apple.com',
      };

  showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return Localizations.override(
        context: context,
        locale: currentLocale,
        child: Builder(
          builder: (context) {
            final l10n = AppLocalizations.of(context)!;

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.smartphone,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.choosePlatform,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.selectAppStore(appName),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              final Uri url = Uri.parse(links['googlePlay']!);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            icon: const Icon(Icons.android),
                            label: Text(l10n.googlePlay),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              final Uri url = Uri.parse(links['appStore']!);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            icon: const Icon(Icons.apple),
                            label: Text(l10n.appStore),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        l10n.cancel,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Widget enhancedContactLink(
  IconData icon,
  String text,
  String url,
  Color color,
) {
  return GestureDetector(
    onTap: () async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: color.withOpacity(0.7),
            size: 16,
          ),
        ],
      ),
    ),
  );
}
