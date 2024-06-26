import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tracking_app/shared/view/base_view.dart';

class PrivacyPolicyContent {
  static const content = {
    'en': '''
      <body>
          <div class="container">
              <h1>Privacy Policy</h1>
              <p>Last updated: 25th Jun 2024</p>

              <h2>1. Introduction</h2>
              <p>This Privacy Policy explains how the Tracking App ("App") collects, uses, and protects your information when
                  you use our services.</p>

              <h2>2. Data Controller</h2>
              <p>The data controller responsible for your personal data is:</p>
              <p>Michal Krol<br>Cologne, Germany<br>Email: <a href="mailto:hello@krolmic.dev">hello@krolmic.dev</a></p>

              <h2>3. Data We Collect</h2>
              <p>We collect the following data:</p>
              <ul>
                  <li><strong>User Account Data:</strong> Information such as your email address and first name, stored by AWS
                      Amplify in AWS Cognito hosted in Virginia.</li>
                  <li><strong>Mood Entries:</strong> Information such as estimated mood, 3 affirmations, and diary entries,
                      stored on an AWS EC2 instance using PostgreSQL hosted in Virginia.</li>
              </ul>

              <h2>4. Purpose of Data Collection</h2>
              <p>We use the data we collect to provide, maintain, and improve the App. Specifically, we use your data to:</p>
              <ul>
                  <li>Provide access to the App and its features.</li>
                  <li>Maintain and improve the App.</li>
                  <li>Communicate with you about your account and provide customer support.</li>
              </ul>

              <h2>5. Data Sharing</h2>
              <p>We do not sell, trade, or otherwise transfer your personal data to third parties. However, we may share your
                  data under the following circumstances:</p>
              <ul>
                  <li>To comply with legal obligations, regulations, or valid governmental requests.</li>
                  <li>To protect and defend our rights and property.</li>
                  <li>With your consent, to any other third party.</li>
              </ul>

              <h2>6. User Rights</h2>
              <p>You have the right to access, correct, or delete your data within the App. Logged-in users can manage their
                  data (including user account data, first name, mood entries, affirmations, and diary entries) within the
                  App.</p>

              <h2>7. Data Security</h2>
              <p>We take the security of your data seriously and implement appropriate measures to protect it. Account
                  information is securely stored by AWS Cognito. Connections to deployed services to store mood entries are
                  secured by SSL certificates, and credentials used to access them are protected against reverse engineering.
              </p>

              <h2>8. International Data Transfers</h2>
              <p>Your data may be transferred to, and processed in, countries other than the country in which you reside,
                  including the United States where our AWS servers are located. We ensure that appropriate safeguards are in
                  place to protect your data when it is transferred internationally.</p>

              <h2>9. Data Retention</h2>
              <p>We retain your data as long as your user account is active. You can delete your account instantly through the
                  App, which will result in the deletion of all associated data.</p>

              <h2>10. Changes to This Privacy Policy</h2>
              <p>We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new
                  Privacy Policy on this page. Your continued use of the App after any changes indicates your acceptance of
                  the new Privacy Policy.</p>

              <h2>11. Contact Us</h2>
              <p>If you have any questions about this Privacy Policy, please contact us at:</p>
              <p>Michal Krol<br>Email: <a href="mailto:hello@krolmic.dev">hello@krolmic.dev</a></p>
          </div>
      </body>
    ''',
    'de': '''
      <body>
          <div class="container">
              <h1>Datenschutzerklärung</h1>
              <p>Zuletzt aktualisiert: 25.06.2024</p>

              <h2>1. Einführung</h2>
              <p>Diese Datenschutzerklärung erklärt, wie die Tracking-App ("App") Ihre Informationen sammelt, verwendet und
                  schützt, wenn Sie unsere Dienste nutzen.</p>

              <h2>2. Datenverantwortlicher</h2>
              <p>Der für Ihre persönlichen Daten verantwortliche Datenverantwortliche ist:</p>
              <p>Michal Krol<br>Köln, Deutschland<br>E-Mail: <a href="mailto:hello@krolmic.dev">hello@krolmic.dev</a></p>

              <h2>3. Von uns gesammelte Daten</h2>
              <p>Wir sammeln die folgenden Daten:</p>
              <ul>
                  <li><strong>Benutzerkontodaten:</strong> Informationen wie Ihre E-Mail-Adresse und Ihren Vornamen,
                      gespeichert von AWS Amplify in AWS Cognito in Virginia.</li>
                  <li><strong>Stimmungseinträge:</strong> Informationen wie geschätzte Stimmung, 3 Affirmationen und
                      Tagebucheinträge, gespeichert auf einer AWS EC2-Instanz mit PostgreSQL in Virginia.</li>
              </ul>

              <h2>4. Zweck der Datenerhebung</h2>
              <p>Wir verwenden die gesammelten Daten, um die App bereitzustellen, zu warten und zu verbessern. Insbesondere
                  verwenden wir Ihre Daten, um:</p>
              <ul>
                  <li>Zugang zur App und ihren Funktionen zu gewähren.</li>
                  <li>Die App zu warten und zu verbessern.</li>
                  <li>Mit Ihnen über Ihr Konto zu kommunizieren und Kundensupport zu bieten.</li>
              </ul>

              <h2>5. Datenweitergabe</h2>
              <p>Wir verkaufen, handeln oder übertragen Ihre persönlichen Daten nicht an Dritte. Wir können Ihre Daten jedoch
                  unter den folgenden Umständen weitergeben:</p>
              <ul>
                  <li>Zur Einhaltung gesetzlicher Verpflichtungen, Vorschriften oder gültiger behördlicher Anfragen.</li>
                  <li>Zum Schutz und zur Verteidigung unserer Rechte und unseres Eigentums.</li>
                  <li>Mit Ihrer Zustimmung an Dritte.</li>
              </ul>

              <h2>6. Benutzerrechte</h2>
              <p>Sie haben das Recht, innerhalb der App auf Ihre Daten zuzugreifen, diese zu korrigieren oder zu löschen.
                  Eingeloggte Benutzer können ihre Daten (einschließlich Benutzerkontodaten, Vorname, Stimmungseinträge,
                  Affirmationen und Tagebucheinträge) innerhalb der App verwalten.</p>

              <h2>7. Datensicherheit</h2>
              <p>Wir nehmen die Sicherheit Ihrer Daten ernst und setzen geeignete Maßnahmen zu deren Schutz um.
                  Kontoinformationen werden sicher in AWS Cognito gespeichert. Verbindungen zu bereitgestellten Diensten zur
                  Speicherung von Stimmungseinträgen sind durch SSL-Zertifikate gesichert, und die zum Zugriff verwendeten
                  Anmeldeinformationen sind vor Reverse Engineering geschützt.</p>

              <h2>8. Internationale Datenübertragungen</h2>
              <p>Ihre Daten können in andere Länder als das Land, in dem Sie wohnen, übertragen und dort verarbeitet werden,
                  einschließlich der Vereinigten Staaten, wo unsere AWS-Server gehostet werden. Wir stellen sicher, dass
                  angemessene Schutzmaßnahmen vorhanden sind, um Ihre Daten bei internationalen Übertragungen zu schützen.</p>

              <h2>9. Datenaufbewahrung</h2>
              <p>Wir bewahren Ihre Daten so lange auf, wie Ihr Benutzerkonto aktiv ist. Sie können Ihr Konto sofort über die
                  App löschen, was zur Löschung aller damit verbundenen Daten führt.</p>

              <h2>10. Änderungen dieser Datenschutzerklärung</h2>
              <p>Wir können diese Datenschutzerklärung von Zeit zu Zeit aktualisieren. Wir werden Sie über Änderungen
                  informieren, indem wir die neue Datenschutzerklärung auf dieser Seite veröffentlichen. Ihre fortgesetzte
                  Nutzung der App nach Änderungen bedeutet Ihre Zustimmung zur neuen Datenschutzerklärung.</p>

              <h2>11. Kontakt</h2>
              <p>Wenn Sie Fragen zu dieser Datenschutzerklärung haben, kontaktieren Sie uns bitte unter:</p>
              <p>Michal Krol<br>E-Mail: <a href="mailto:hello@krolmic.dev">hello@krolmic.dev</a></p>
          </div>
      </body>
    ''',
  };

  static String getContent(BuildContext context) {
    return content[
            Localizations.localeOf(context).languageCode.substring(0, 2)] ??
        content['en']!;
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = PrivacyPolicyContent.getContent(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.privacyPolicy,
        ),
        centerTitle: true,
      ),
      body: BaseView(
        addVerticalPadding: true,
        child: SingleChildScrollView(
          child: HtmlWidget(content),
        ),
      ),
    );
  }
}
