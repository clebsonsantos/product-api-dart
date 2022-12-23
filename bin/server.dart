import 'package:shelf_router/shelf_router.dart';
import 'main.dart';

final _router = Router();

void main(List<String> args) async {
  await bootstrap(_router);
}
