import 'package:flutter_test/flutter_test.dart';


import 'package:hostagift/main.dart';
import 'package:hostagift/features/auth/ui/login_page.dart';

void main() {
  testWidgets('MyApp si avvia e mostra LoginPage', (WidgetTester tester) async {
    // 1) monta il widget
    await tester.pumpWidget(const MyApp());
    // 2) aspetta che router e animazioni si stabilizzino
    await tester.pumpAndSettle();
    // 3) verifica che sia presente almeno un LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
