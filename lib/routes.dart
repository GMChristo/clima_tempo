import 'package:angular_router/angular_router.dart';
import 'package:clima_tempo_browser/src/home_page/home_page.template.dart' as home_page_template;
import 'package:clima_tempo_browser/src/clima_detalhado/clima_detalhado.template.dart' as clima_detalhado_template;

class Routes {
  static final homePage = RouteDefinition(
    routePath: RoutePath(path:  'home-page'),
    component: home_page_template.HomeNgFactory,
    useAsDefault: true,//so usado na pagina inicial
  );

  static final climaDetalhado = RouteDefinition(
    routePath: RoutePath(path: 'clima-detalhado'),
    component: clima_detalhado_template.ClimaDetalhadoNgFactory,
  );

  static final all = <RouteDefinition>[homePage, climaDetalhado,];
}