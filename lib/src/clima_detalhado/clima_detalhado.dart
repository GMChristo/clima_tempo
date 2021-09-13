import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:clima_tempo_browser/src/models/clima_model.dart';
import 'package:clima_tempo_browser/src/service/clima_service.dart';

@Component(
  selector: 'clima-detalhado',
  templateUrl: 'clima_detalhado.html',
  styleUrls: ['clima_detalhado.css'],
  directives: [
    coreDirectives,
    formDirectives,
  ],
  providers: [
    ClassProvider(ClimaService),
  ],
)
class ClimaDetalhado implements OnActivate{
  bool showDetalhes = false;
  Clima climaDetalhes;
  var teste;
  final ClimaService _climaService;

  ClimaDetalhado(this._climaService);

  // @override
  // void ngOnInit() {
  //   print('ClimaDetalhado iniciado!');
  //   print('ClimaDetalhesOnInit = ${_climaService.getAll()}');
  // }

  @override
  void onActivate(RouterState previous, RouterState current) {
    // print('onActivate ${_climaService.toString()}');
    print('onActivate inicio');
    var teste = _climaService.getAll();
    print('onActivate teste $teste');
    for (var e in teste) {
      print('onActivate ${e.cidade}');
    }
  }

  void detalhes(Clima clima) {
    // Clima climaDetalhes;
    // climaDetalhes = Clima();
    var climaDetalhes = clima;
    showDetalhes = true;
    print('Show Detalhe: $showDetalhes');
    // climaDetalhes.tempAtual = clima.tempAtual;
    print('Clima detalhes');
    print('Clima = $clima');
    print('Clima Cidade = ${clima.cidade}');
    // print('ClimaTempAtual = ${clima.tempAtual}');
    print('ClimaDetalhesTempAtual = ${climaDetalhes.tempAtual}');
  }

  Future<void> detalhados() async {

  }

}
