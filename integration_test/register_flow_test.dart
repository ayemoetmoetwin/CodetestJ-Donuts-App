import 'package:integration_test/integration_test.dart';

import '../test/register_to_product_test.dart' as flow;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  flow.main();
}
