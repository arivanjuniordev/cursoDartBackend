import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    final Router router = Router();

    router.get('/blog/noticias', (Request req) {
      return Response.ok('choveu hj');
    });

    return router;
  }
}
