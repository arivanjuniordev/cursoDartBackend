import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request req) {
      return Response(200, body: 'Primeira Rota');
    });

    router.get('/query', (Request req) {
      final String? nome = req.url.queryParameters['nome'];
      final String? idade = req.url.queryParameters['idade'];

      return Response.ok("Nome $nome Idade $idade");
    });

    router.post('/login', (Request req) async {
      final result = await req.readAsString();

      Map<String, dynamic> json = jsonDecode(result);

      final String usuario = json['usuario'];
      final String senha = json['senha'];

      if (usuario == 'admin' && senha == '123') {
        Map<String, dynamic> response = {'message': 'seja bem vindo'};
        String jsonResponse = jsonEncode(response);

        return Response.ok(jsonResponse,
            headers: {'content-type': 'application/json'});
      } else {
        return Response.forbidden('Acesso Negado');
      }
    });

    return router;
  }
}
