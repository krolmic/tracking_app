import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tracking_app/shared/view/base_view.dart';

class TermsOfServiceContent {
  static const content = {
    'en': '''
      <body>
          <div class="container">
              <h1>Terms of Service</h1>
              <p>Last updated: 25th Jun 2024</p>

              <h2>1. Acceptance of Terms</h2>
              <p>By accessing or using the Tracking App ("App"), you agree to be bound by these Terms of Service. If
                  you do not agree to these Terms, please do not use the App.</p>

              <h2>2. Description of Service</h2>
              <p>The App provides users with tools to track their mood, record affirmations, and maintain a diary. User
                  account data and mood entries are stored securely on AWS services.</p>

              <h2>3. User Accounts</h2>
              <p>To use the App, you must create an account. You are responsible for maintaining the confidentiality of your
                  account information and for all activities that occur under your account.</p>

              <h2>4. Data Collection and Use</h2>
              <p>The following data is collected and stored:</p>
              <ul>
                  <li><strong>User Account Data:</strong> Stored by AWS Amplify in AWS Cognito hosted in Virginia. This
                      includes information such as your email address and first name.</li>
                  <li><strong>Mood Entries:</strong> Stored on an AWS EC2 instance using PostgreSQL hosted in Virginia. This
                      includes estimated mood, 3 affirmations, and diary entries that users can save as often as they like.
                  </li>
              </ul>
              <p>We use this data to provide, maintain, and improve the App. We do not sell, trade, or otherwise transfer your
                  personal data to third parties.</p>

              <h2>5. Data Security</h2>
              <p>We take data security seriously and implement measures to protect your data. However, no method of
                  transmission over the Internet or method of electronic storage is 100% secure. Therefore, we cannot
                  guarantee its absolute security.</p>

              <h2>6. Data Retention</h2>
              <p>We retain user data as long as the user account is not deleted. Users can delete their accounts instantly
                  through the App, which will result in the deletion of all associated data.</p>

              <h2>7. User Rights</h2>
              <p>Logged-in users can access, correct, or delete their data (including user account data, first name, mood
                  entries, affirmations, and diary entries) within the App.</p>

              <h2>8. Third-Party Services</h2>
              <p>We use the following third-party services to store and process your data:</p>
              <ul>
                  <li><strong>AWS Cognito:</strong> Used by AWS Amplify to save user account data.</li>
                  <li><strong>AWS EC2:</strong> Used to host the Serverpod instance with PostgreSQL for storing mood entries
                      data.</li>
              </ul>

              <h2>9. User Conduct</h2>
              <p>By using the App, you agree not to:</p>
              <ul>
                  <li>Violate any applicable laws or regulations.</li>
                  <li>Upload or transmit any harmful or disruptive content.</li>
                  <li>Impersonate any person or entity.</li>
              </ul>

              <h2>10. Termination</h2>
              <p>We reserve the right to terminate or suspend your account at our sole discretion, without notice, if you
                  violate these Terms or engage in any activity that we deem harmful to the App or other users.</p>

              <h2>11. Limitation of Liability</h2>
              <p>To the fullest extent permitted by law, we are not liable for any indirect, incidental, special,
                  consequential, or punitive damages arising out of or related to your use of the App.</p>

              <h2>12. Changes to the Terms</h2>
              <p>We may update these Terms from time to time. We will notify you of any changes by posting the new Terms on
                  this page. Your continued use of the App after any changes indicates your acceptance of the new Terms.</p>

              <h2>13. Governing Law</h2>
              <p>These Terms shall be governed and construed in accordance with the laws of Germany, without regard to its
                  conflict of law principles.</p>

              <h2>14. Contact Us</h2>
              <p>If you have any questions about these Terms, please contact us at: <a
                      href="mailto:hello@krolmic.dev">hello@krolmic.dev</a>.</p>
              <p>Michal Krol, Cologne, Germany</p>
          </div>
      </body>
    ''',
    'de': '''
      <body>
          <div class="container">
              <h1>Nutzungsbedingungen</h1>
              <p>Zuletzt aktualisiert: 25.06.2024</p>

              <h2>1. Annahme der Bedingungen</h2>
              <p>Durch den Zugriff auf oder die Nutzung der Tracking-App ("App") stimmen Sie zu, an diese Nutzungsbedingungen
                  gebunden zu sein. Wenn Sie diesen Bedingungen nicht zustimmen, nutzen Sie die App bitte
                  nicht.</p>

              <h2>2. Beschreibung des Dienstes</h2>
              <p>Die App bietet Nutzern Werkzeuge zur Stimmungsverfolgung, zum Aufzeichnen von Affirmationen und zum Führen
                  eines Tagebuchs. Benutzerdaten und Stimmungseinträge werden sicher auf AWS-Diensten gespeichert.</p>

              <h2>3. Benutzerkonten</h2>
              <p>Um die App zu nutzen, müssen Sie ein Konto erstellen. Sie sind dafür verantwortlich, die Vertraulichkeit
                  Ihrer Kontoinformationen zu wahren und für alle Aktivitäten, die unter Ihrem Konto stattfinden.</p>

              <h2>4. Datenerfassung und -nutzung</h2>
              <p>Folgende Daten werden erfasst und gespeichert:</p>
              <ul>
                  <li><strong>Benutzerkontodaten:</strong> Gespeichert von AWS Amplify in AWS Cognito in Virginia. Dazu
                      gehören Informationen wie Ihre E-Mail-Adresse und Ihr Vorname.</li>
                  <li><strong>Stimmungseinträge:</strong> Gespeichert auf einer AWS EC2-Instanz mit PostgreSQL in Virginia.
                      Dazu gehören geschätzte Stimmung, 3 Affirmationen und Tagebucheinträge, die Benutzer so oft wie
                      gewünscht speichern können.</li>
              </ul>
              <p>Wir verwenden diese Daten, um die App bereitzustellen, zu warten und zu verbessern. Wir verkaufen, handeln
                  oder übertragen Ihre persönlichen Daten nicht an Dritte.</p>

              <h2>5. Datensicherheit</h2>
              <p>Wir nehmen die Datensicherheit ernst und setzen Maßnahmen ein, um Ihre Daten zu schützen. Keine Methode der
                  Übertragung über das Internet oder der elektronischen Speicherung ist jedoch 100% sicher. Daher können wir
                  die absolute Sicherheit nicht garantieren.</p>

              <h2>6. Datenaufbewahrung</h2>
              <p>Wir bewahren Benutzerdaten auf, solange das Benutzerkonto nicht gelöscht wird. Benutzer können ihre Konten
                  sofort über die App löschen, was zur Löschung aller zugehörigen Daten führt.</p>

              <h2>7. Benutzerrechte</h2>
              <p>Eingeloggte Benutzer können auf ihre Daten zugreifen, diese korrigieren oder löschen (einschließlich
                  Benutzerkontodaten, Vorname, Stimmungseinträge, Affirmationen und Tagebucheinträge) innerhalb der App.</p>

              <h2>8. Dienste von Drittanbietern</h2>
              <p>Wir verwenden die folgenden Dienste von Drittanbietern, um Ihre Daten zu speichern und zu verarbeiten:</p>
              <ul>
                  <li><strong>AWS Cognito:</strong> Wird von AWS Amplify verwendet, um Benutzerkontodaten zu speichern.</li>
                  <li><strong>AWS EC2:</strong> Wird verwendet, um die Serverpod-Instanz mit PostgreSQL für die Speicherung
                      von Stimmungseinträgen zu hosten.</li>
              </ul>

              <h2>9. Benutzerverhalten</h2>
              <p>Durch die Nutzung der App stimmen Sie zu, dass Sie:</p>
              <ul>
                  <li>Keine geltenden Gesetze oder Vorschriften verletzen.</li>
                  <li>Keine schädlichen oder störenden Inhalte hochladen oder übertragen.</li>
                  <li>Sich nicht als eine andere Person oder ein anderes Unternehmen ausgeben.</li>
              </ul>

              <h2>10. Beendigung</h2>
              <p>Wir behalten uns das Recht vor, Ihr Konto nach eigenem Ermessen und ohne Vorankündigung zu kündigen oder zu
                  sperren, wenn Sie diese Bedingungen verletzen oder sich an Aktivitäten beteiligen, die wir als schädlich für
                  die App oder andere Benutzer erachten.</p>

              <h2>11. Haftungsbeschränkung</h2>
              <p>Soweit gesetzlich zulässig, haften wir nicht für indirekte, zufällige, besondere, Folgeschäden oder
                  Strafschäden, die sich aus oder im Zusammenhang mit Ihrer Nutzung der App ergeben.</p>

              <h2>12. Änderungen der Bedingungen</h2>
              <p>Wir können diese Bedingungen von Zeit zu Zeit aktualisieren. Wir werden Sie über Änderungen informieren,
                  indem wir die neuen Bedingungen auf dieser Seite veröffentlichen. Ihre fortgesetzte Nutzung der App nach
                  Änderungen bedeutet Ihre Zustimmung zu den neuen Bedingungen.</p>

              <h2>13. Anwendbares Recht</h2>
              <p>Diese Bedingungen unterliegen den Gesetzen Deutschlands und werden in Übereinstimmung mit diesen ausgelegt,
                  ohne Rücksicht auf Kollisionsnormen.</p>

              <h2>14. Kontakt</h2>
              <p>Wenn Sie Fragen zu diesen Bedingungen haben, kontaktieren Sie uns bitte unter: <a
                      href="mailto:hello@krolmic.dev">hello@krolmic.dev</a>.</p>
              <p>Michal Krol, Köln, Deutschland</p>
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

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = TermsOfServiceContent.getContent(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.termsOfService,
        ),
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
