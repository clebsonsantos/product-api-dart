import 'package:dotenv/dotenv.dart';
import 'package:shelf_router/shelf_router.dart';
import 'main/bootstrap.dart';
import 'package:mysql1/mysql1.dart';
final _router = Router();

void main() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  var connection = await MySqlConnection.connect(
    ConnectionSettings(
      host: '${env["DB_HOST"]}',
      port: int.parse(env["DB_PORT"]!),
      user:'${env["DB_USER"]}',
      password: '${env["DB_PASS"]}',
      useSSL: false,
      db: '${env["DB_SCHEMA"]}'
    )
  );
  print(connection);
  await bootstrap(_router);
}
