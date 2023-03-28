import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mbl/app/app.dart';
import 'package:mbl/bootstrap.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/environment/development/.env');
  await bootstrap(() => const App());
}
