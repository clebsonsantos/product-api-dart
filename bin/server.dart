import 'package:shelf_router/shelf_router.dart';
import 'main.dart';
import 'package:mysql1/mysql1.dart';
final _router = Router();

void main() async {
  var connection = await MySqlConnection.connect(ConnectionSettings(host: "localhost", port: 3306, user: "root", password: "docker", useSSL: false, db: "products_dart"));
  print(connection);
  await bootstrap(_router);
}
